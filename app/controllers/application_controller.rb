class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale, :category_all
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, NoMethodError, with: :not_found?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def not_found?
    render file: "#{Rails.root}/public/404.html", status: 403, layout: false
  end

  private

  def admin_user?
    redirect_to root_path unless current_user.admin?
  end

  def category_all
    @categories = Category.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: User::PARAMS
    devise_parameter_sanitizer.permit :account_update, keys: User::PARAMS
  end

  def after_sign_in_path_for resource
    return backend_path if resource.admin?
    root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html{redirect_to main_app.root_path, alert: exception.message}
    end
  end
end
