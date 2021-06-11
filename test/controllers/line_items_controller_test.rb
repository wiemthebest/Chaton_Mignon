require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    tshirt = items(:one)
  
    assert_difference('LineItem.count') do
      post line_items_url, params: { item_id: tshirt.id }
    end
  
    assert_redirected_to cart_url(LineItem.last.cart)
    follow_redirect!
  
    assert_select 'li', "#{tshirt.title} (x 1)"
  
    post line_items_url, params: { item_id: tshirt.id }
    follow_redirect!
  
    assert_select 'li', "#{tshirt.title} (x 2)"
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, item_id: @line_item.item_id, quantity: @line_item.quantity } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end
