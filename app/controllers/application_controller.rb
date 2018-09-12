class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  before_action :set_locale, :category_all

  rescue_from ActiveRecord::RecordNotFound, NoMethodError, with: :not_found?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def not_found?
    render file: "#{Rails.root}/public/404.html", status: 403, layout: false
  end

  private

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "application.please_login"
    redirect_to login_path
  end

  def admin_user?
    redirect_to root_path unless current_user.admin?
  end

  def category_all
    @categories = Category.all
  end
end
