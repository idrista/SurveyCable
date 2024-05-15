class ApplicationController < ActionController::Base
  before_action :should_be_registered

  def registered_user
    session[:id]
  end

  private
  def should_be_registered
    unless session[:id]
      session[:referer] = request.url
      redirect_to :register
    end
  end
end
