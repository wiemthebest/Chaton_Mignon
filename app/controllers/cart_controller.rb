class CartController < ApplicationController
rescue_form ActiveRecord::RecordNotFound, with: :cart_not_found
before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end
  
  def new
    @cart = Cart.new
  end

  def create 
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html {redirect_to @cart, notice: 'Panier crée avec succès.'}
        format.json {render :show, status: :created, location: @cart}
      else
        format.html {render :new}
        format.json {render json: @cart.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    return unless @cart.id == session[:cart_id]

    @cart.destroy
    session.delete(:cart_id) 

    respond_to do |format|
      format.html {redirect_to root_url, notice: 'Votre panier est vide.'}
      format.json {head :no_content} 
    end
  end

  private

  def cart_not_found
    redirect_to root_url, alert: t(".cart_not_found")
  end
  
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
