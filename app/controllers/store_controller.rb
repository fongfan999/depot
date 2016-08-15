class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
