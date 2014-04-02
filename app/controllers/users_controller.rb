class UsersController < ApplicationController
  skip_before_filter :require_authentication, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    redirect_to users_path, notice: "Hi #{@user.username}! Welcome to DuckGoose!"
  end

  def update
    current_user.update_attributes!(user_params)
    redirect_to users_path, notice: "Successfully updated profile."
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
    end
end
