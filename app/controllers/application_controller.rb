class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :login, :logout!, :loggedin?, :ensure_login

  def current_user
    @current_user ||= User.find_by(session_token: session[session_token])
  end

  def loggedin?
    !!current_user
  end

  def login(user)
    user.ensure_session_token
    session[session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token
    session[session_token] = nil
  end

  def ensure_login
    #TODO
  end
end
