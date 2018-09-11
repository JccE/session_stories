class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      p "Logged in!"
      redirect_to sessions_path
    else
      flash[:error] = "There was a problem logging in. Please check your email and password."
      render action: 'new'
    end
  end

  def destroy
    user = User.find_by(email: params[:email])
    session[:user_id] = nil
    user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end
end
