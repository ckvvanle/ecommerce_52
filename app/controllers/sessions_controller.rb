class SessionsController < ApplicationController

  def new; end

  def create
    return flash_danger unless params[:session].present?
    session = params[:session]
    user = User.find_by email: session[:email].downcase
    if user&.authenticate(session[:password])
      login_admin_user user
    else
      flash_danger
    end
  end

  def flash_danger
    flash.now[:danger] = t ".invalid_email_password"
    render :new
  end

  def remember_me user
    if params[:session][:remember_me] == Settings.sessions.is_remember
      remember user
    else
      forget user
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def login_admin_user user
    log_in user
    remember_me user
    user.admin? ? redirect_to(backend_path) : redirect_to(root_path)
  end
end
