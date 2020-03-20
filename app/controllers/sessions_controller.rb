class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    redirect_to '/items/index' unless !logged_in?
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :items_index
    else
      flash[:danger] = "Invalid credentials"
      redirect_to :login
    end
  end

  def login
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

  def index
    redirect_to :items_index unless !logged_in?
  end

  
end