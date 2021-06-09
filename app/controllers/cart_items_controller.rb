class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_cart_items, only: [:show, :edit, :update, :destroy]

  def index
    @cart_items = CartItem.all
  end

  def new
    @cart_items = CartItem.new
  end

  def create
    item = Item.find(params[:item_id])
    @cart_items = @cart.add_product(product)

    respond_to do |format|
      if @cart_items.save
        format html {redirect_to @cart_item.cart, notice: 'Panier créer avec succès'}
        format json {render :show, status: :created, location: @cart_item}
      else
      end
    redirect_to cart_item_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(post_params)
    redirect_to cart_item_path
  end

  def destroy
    @cart_items = CartItem.find(params [:id])
    @cart_items.destroy
    redirect_to cart_item_path
  end

  private

  def post_params
    post_params = params.require(:item).permit(:title, :price)
  end
end
