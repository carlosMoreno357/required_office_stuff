class ItemsController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def index
      case params[:filter].to_i
      when 1
        if current_user.admin
          @items = Item.where(:status => "open")
        else
          @items = Item.where(:status => "open", :user_id => session[:user_id]) 
        end
      when 2
        if current_user.admin
          @items = Item.where(:status => "fulfilled")
        else
          @items = Item.where(:status => "fulfilled", :user_id => session[:user_id])
        end
      when 3
        if current_user.admin
          @items = Item.where(:status => "dismissed")
        else
          @items = Item.where(:status => "dismissed", :user_id => session[:user_id])
        end
      else
        if current_user.admin
          @items = Item.all
        else
          @items = Item.where(:user_id => session[:user_id]) 
        end
      end
  end

  def new
    @categories = Category.all
  end

  def create
    new_item=Item.create(description:params[:description ],category_id: params[:category].to_i, status: 1, user_id: current_user.id)
    send_requirements_to_all_admins(User.find_by(id: current_user.id), new_item)
    redirect_to(root_path)
  end

  def fulfill
    item=Item.find_by(id: params[:id])
    item.update(status: 0)
    MailService.status_change_mail(User.find_by(id: current_user.id),item)
    redirect_to(root_path)
  end

  def dismiss
    item=Item.find_by(id: params[:id])
    item.update(status: 2)
    MailService.status_change_mail(User.find_by(id: current_user.id),item)
    redirect_to(root_path)
  end

  def comment
    @item=Item.find_by(id: params[:id])
    @comments= Comment.where(item_id: @item.id)
  end

  def create_detail
    item=Item.find_by(id: params[:id])
    item.update(comment: params[:comment])
    redirect_to(root_path)
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorized
    redirect_to :login unless logged_in?
  end

  private

  def send_requirements_to_all_admins(user,new_item)
    administrators= User.select(:email).where(admin:true)
    administrators.each do |admin|
      MailService.new_requirement_mail(User.find_by(id: current_user.id),admin.email,new_item)
    end
  end

end
