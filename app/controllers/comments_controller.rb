class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.create(description: params[:description], item_id: @item.id, user_id: session[:user_id])
    @item.user_id != @comment.user.id ? MailService.comment_mail(User.find_by(id: current_user.id),@item) : nil
    redirect_to(root_path)
  end

end