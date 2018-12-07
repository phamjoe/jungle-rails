class AdminController < ApplicationController
  before_action :admin_auth

  private 
  def admin_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end 
end