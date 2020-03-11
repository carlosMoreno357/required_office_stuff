class ItemsController < ActionController::Base
    def index
        @items = Item.all
    end

    def new
        @categories = Category.all
    end

    def create
        Item.create(description:params[:description ],category_id: params[:category].to_i, status: 1)
        redirect_to '/'
    end

    def fulfill
        item=Item.find_by(id: params[:id])
        item.update(status: 0)
        redirect_to '/'
    end

    def dismiss
        item=Item.find_by(id: params[:id])
        item.update(status: 2)
        redirect_to '/'
    end

end
