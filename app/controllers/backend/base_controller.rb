class Backend::BaseController < ApplicationController
  before_action :logged_in_user, :admin_user?
  layout "admin"
end
