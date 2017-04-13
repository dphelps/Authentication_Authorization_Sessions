class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DemosHelper
  
  before_action :authorize
  
  protected
  
  def authorize
    unless logged_in?
      redirect_to login_path, notice: "Please log in"
    end
  end
end
