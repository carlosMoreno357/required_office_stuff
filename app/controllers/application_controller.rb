class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  
  def logged_in?
    !current_user.nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorized
   redirect_to :items_index unless logged_in?
  end

end
