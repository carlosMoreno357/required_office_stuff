class ItemsController < ApplicationController
  before_action :authorized

  def index
    filter_params ? @items = Item.where(:status => filter_params.to_i) : @items = Item.all
  end

  def new
    @categories = Category.all
  end

  def create
    new_item=Item.create(description:params[:description ],category_id: params[:category].to_i, status: 1, user_id: current_user.id)
    send_requirements_to_all_admins(current_user, new_item)
    redirect_to(root_path)
  end

  def fulfill
    ChangeStatusService.set(0,params[:id],current_user) if current_user&.admin?
    redirect_to(root_path)
  end

  def dismiss
    ChangeStatusService.set(2,params[:id],current_user) if current_user&.admin?
    redirect_to(root_path)
  end

  def details
    @item=Item.find(params[:id])
    @comments= Comment.where(item_id: @item.id)
  end

  def create_details
    item=Item.find(params[:id])
    item.update(details: params[:details])
    redirect_to(root_path)
  end

  def authorized
    redirect_to :login unless logged_in?
  end

  private

  def send_requirements_to_all_admins(user,new_item)
    administrators= User.select(:email).where(admin:true)
    administrators.each do |admin|
      MailService.new_requirement_mail(current_user,admin.email,new_item)
    end
  end

  def filter_params
    params[:filter] != '3' ?  params[:filter] : nil
  end

end
