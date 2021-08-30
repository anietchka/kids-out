class ProfilesController < ApplicationController

  def show
    @user = current_user
    authorize @user
  end
  
  def edit
    @user = user.find(params[:id])
  end

  def update
    @user = user.find(params[:id])
    @user = user.update(user_params)
    redirect_to user_path(@user)
  end
end