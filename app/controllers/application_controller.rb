class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Returns the currently logged in user
  def current_user
    return @current_user if @current_user

    return nil unless (session[:user_id])

    return @current_user = User.find_by_id(session[:user_id])
  end
  
  helper_method :current_user

  # call this after logging in a user in to redirect them to the page that
  # required login.
  def redirect_after_login
    redir_target = session[:return_to] || user_path(current_user)
    session[:return_to] = nil
    redirect_to redir_target, :notice => "Welcome, #{current_user.name}"
  end

  private

  # Redirects to root_url unless the user is logged in.
  def require_user
    unless current_user
      session[:return_to] = request.fullpath
      redirect_to login_url, :alert => "You must be logged in to do that."
    end
  end
end
