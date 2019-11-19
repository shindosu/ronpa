class UsersController < ApplicationController
  def show
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end
