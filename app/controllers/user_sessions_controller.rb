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


  def destroy
    current_user_session.destroy
    flash[:message] = "Logout Successfully"
    redirect_back_or_default login_url
  end

  def openid_login
    response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        :identifier => "https://www.google.com/accounts/o8/id",
        :required => ["http://axschema.org/contact/email",
                      "http://axschema.org/namePerson/first",
                      "http://axschema.org/namePerson/last"],
        :return_to => openid_authenticate_url,
        :method => 'POST')
    head 401
  end

  def openid_authenticate
    if openid = request.env[Rack::OpenID::RESPONSE]
      case openid.status
      when :success
        ax = OpenID::AX::FetchResponse.from_success_response(openid)
        user = User.where(:openid_identifier => openid.display_identifier).first
        user ||= User.create!(:openid_identifier => openid.display_identifier,
                              :email => ax.get_single('http://axschema.org/contact/email'),
                              :first_name => ax.get_single('http://axschema.org/namePerson/first'),
                              :last_name => ax.get_single('http://axschema.org/namePerson/last'))
        session[:user_id] = user.id
        redirect_to(session[:redirect_to] || home_url)
        return
      when :failure
        render :action => 'problem'
      end
    else
      redirect_to new_session_path
    end
  end


end
