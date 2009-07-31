class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:ok] = "You are now logged in"
      redirect_to new_lending_path
    else
      flash[:error] = "Login failed. Try again"
      render :action => :new
    end
  end
end