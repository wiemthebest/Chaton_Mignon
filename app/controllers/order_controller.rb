class OrderController < ApplicationController
include CurrentCart
before_action :set_cart, only: [:new, :create]
before_action :redirect_if_cart_is_empty, only: :new
before_action :set_order, only: [:show, :edit, :update, :destroy]

 def index
    @orders = Order.all
 end

 def new
   @order = Order.new
 end

 def create
  @order = Order.new(order_params)
  @order.cart = @cart

  respond_to do |format|
	 if @order.save
    session.delete(:cart_id)
	  format.html {redirect_to root_path, notice: 'Commande validée.'}
	  format.json {render :show, status: :created, location: @order}
	 else
	  format.html {render :new}
	  format.json {render json: @order.errors, status: :unprocessable_entity}
	 end
	end
 end

 def update
    respond_to do |format|
	if @order.update(order_params)
	format.html {redirect_to @order, notice: 'Commande mise à jour avec succès'}
        format.json {render :show, status: :created, location: @order}
      else
        format.html {render :new}
        format.json {render json: @order.errors, status: :unprocessable_entity}
      end
    end	
 end

 def destroy
   @order.destroy
   respond_to do |format|
      format.html {redirect_to order_url, notice: 'Commande détruit avec succès'}
      format.json {head :no_content}
 end

 private

      def set_order
	@order = Order.find(params[:id])
      end

  def order_params
    params.require(:order).permit(:name, :address, :email)
  end

  def redirect_if_cart_is_empty
   if @cart.cart_items.empty?
	redirect_to root_url, notice: "Votre panier est vide"
   end
  end

end
