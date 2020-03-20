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
        Item.create(description:params[:description ],category_id: params[:category].to_i, status: 1, user_id: session[:user_id])
        redirect_to(root_path)
    end

    def fulfill
        item=Item.find_by(id: params[:id])
        item.update(status: 0)
        redirect_to(root_path)
    end

    def dismiss
        item=Item.find_by(id: params[:id])
        item.update(status: 2)
        redirect_to(root_path)
    end

    def comment
        @item=item=Item.find_by(id: params[:id])
    end

    def create_comment
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
end
