class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  enable_authorization :unless => :devise_controller?

  alias current_user current_account

  before_filter :authenticate_account!

  rescue_from CanCan::Unauthorized do |exception|
    redirect_to root_url, :alert => exception.message
  end



end
