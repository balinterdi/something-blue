class UserSessionsController < ApplicationController

  def new
    #FIXME: gave up trying to make it really nice and separate user session
    # in its own model
    @user_session = UserSession.new
  end

  def create
    #FIXME: gave up trying to make it really nice and separate user session
    # in its own model
    # @user_session = UserSession.new(self, params[:user_session])
    user = User.authenticate(params[:user_session])
    if user
      request.session[:user_login] = user.login
      flash[:ok] = "You are now logged in"
      redirect_to new_lending_path
    else
      flash[:error] = "Login failed. Try again"
      render :action => :new
    end
  end

  def destroy
    request.session[:user_login] = nil
    redirect_to login_path
  end
end