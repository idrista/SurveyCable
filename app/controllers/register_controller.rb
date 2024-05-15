class RegisterController < ApplicationController
  skip_before_action :should_be_registered

  def index
  end

  def create_user
    session[:user]  = register_username_params
    session[:id]    = SecureRandom.uuid
    redirect_to session[:referer] || :root
  end

  private
    def register_username_params
      params.require(:username)
    end
end
