class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @user = current_user
    authorize @user
  end
end
