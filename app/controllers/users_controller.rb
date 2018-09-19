class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  load_and_authorize_resource

  def show
    @suggests = Suggest.feed_user_id(current_user.id)
  end
end
