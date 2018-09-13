class UsersController < ApplicationController
  before_action :load_user, only: %i(edit update show)
  before_action :logged_in_user, only: %i(update edit show)
  before_action :category_all

  def new
    @user = User.new
  end

  def show
    @suggests = Suggest.feed_user_id(current_user.id)
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "users.create.title_text"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.create.message_update"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def load_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :address, :phone
  end
end
