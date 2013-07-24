class UserSessionsController < ApplicationController
 before_filter :require_user, :only => :destroy
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:message] = "Login Successful"
      redirect_back_or_default posts_url
    else
      render :action => :new
    end
  end

  def show

  end

  def destroy
    current_user_session.destroy
    flash[:message] = "Logout Successfully"
    redirect_back_or_default login_url
  end

end
