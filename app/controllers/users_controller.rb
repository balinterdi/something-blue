class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:ok] = "User has been created"
      redirect_to login_path
    end
  end
end
