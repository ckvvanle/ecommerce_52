class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @q = Product.ransack params[:q]
    @products = @q.result.paginate page: params[:page],
     per_page: Settings.per_product
  end

  def show
    @comment = Comment.new
    @comments = Comment.includes(:user).newest.paginate page: params[:page],
      per_page: Settings.per_page
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "error.product_not_found"
    redirect_to root_path
  end
end
