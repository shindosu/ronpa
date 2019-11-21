class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize_user
  end

  def dashboard
    @user = current_user
    @topics = Topic.first(10)
    authorize_user
  end

  private
  def authorize_user
    authorize @user
  end
end
