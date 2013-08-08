class ApplicationController < ActionController::Base
  protect_from_forgery
  private
   include UserSessionsHelper

  helper_method :current_user_session, :current_user


end
