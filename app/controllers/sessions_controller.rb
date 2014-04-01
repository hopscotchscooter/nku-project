class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = student.id
      redirect_to users_path, notice: "Signed in!"
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end