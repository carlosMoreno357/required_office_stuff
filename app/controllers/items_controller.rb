class ItemsController < ActionController::Base
    def index
        case params[:filter]
        when "1"
            @items = Item.where(:status => "open")
        when "2"
            @items = Item.where(:status => "fulfilled")
        when "3"
            @items = Item.where(:status => "dismissed")
        else
            @items = Item.all
        end
    end

    def new
        @categories = Category.all
    end

    def create
        Item.create(description:params[:description ],category_id: params[:category].to_i, status: 1)
        redirect_to(root_path, status: :created)
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

    def comment
        @item=item=Item.find_by(id: params[:id])
    end

    def create_comment
        item=Item.find_by(id: params[:id])
        item.update(comment: params[:comment])
        redirect_to(root_path, status: 201)
    end

end
