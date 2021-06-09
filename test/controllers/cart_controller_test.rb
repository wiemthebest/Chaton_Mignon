require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should not destroy cart" do
    post cart_items_url, params: {item_id: items(:one).id}
    
    assert_no_difference("Cart.count") do
      delete cart_url(@cart)
    end
    assert_response 204
  end

  test "should destroy cart if session matches" do
    post cart_items_url, params: {item_id: items(:one).id}
    @cart = Cart.find(session[:cart_id])

    assert_no_difference("Cart.count", -1) do
      delete cart_url(@cart)
    end
    assert_redirected_to root_url
  end

end

