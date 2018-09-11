class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      Notifier.with(user: user).password_reset(user).deliver_later
      p "bay"
      flash[:success] = "Password reset instructions sent. Please check your email"
      p "bay 2"
      redirect_to login_path
    else
      p "hey"
      # p render_to_string
      render action: 'new'
      flash[:notice] = "Email not found."
      p "hey 2"
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
    if @user
    else
      render file: 'public/404.html', status: :not_found
    end
  end


  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user && @user.update_attributes(user_params)
      @user.update_attributes(:password_reset_token, nil)
      session[:user_id] = @user.id
      redirect_to sessions_path, success: "Password updated."
    else
      flash.now[:notice] = "Password reset token not found."
      render action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
