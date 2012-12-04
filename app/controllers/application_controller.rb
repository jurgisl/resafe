class ApplicationController < ActionController::Base
  protect_from_forgery
  
  check_authorization :unless => :devise_controller?
  
  before_filter :authenticate_user!, :unless => :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "Access denied"
  end
end
