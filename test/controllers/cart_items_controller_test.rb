require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_item = cart_items (:one)
  end

  test "should create cart_item" do
    assert_difference ('CartItem.count') do
      post cart_item_url, params: {cart_item: {cart_id: @cart_item.cart_id}}
    end
    assert_redirected_to cart_item_url(CartItem.last)
  end

  test "should show cart_item" do
    get cart_item_url(@cart_item)
    assert_reponse :success
  end
  # test "the truth" do
  #   assert true
  # end
end
