class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update]

  def show
  end

  def update
    if user_signed_in? && current_user == @user
      user = User.find(params[:id])
      user.update(user_params)
      profile = user.profile
      profile.update(profile_params)
    end
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def profile_params
    params.require(:user).require(:profiles).permit(:citizenship, :icon, :gender, :age)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
