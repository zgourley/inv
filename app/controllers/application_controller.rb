class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  include SessionsHelper

  # rescue_from 'ActiveRecord::InvalidForeignKey' do
  # end
    
private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_list
    @current_list ||= List.find(session[:list_id]) if session[:list_id]
  end

end
