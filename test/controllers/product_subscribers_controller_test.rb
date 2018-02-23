require 'test_helper'

class ProductSubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_subscriber = product_subscribers(:one)
  end

  test "should get index" do
    get product_subscribers_url
    assert_response :success
  end

  test "should get new" do
    get new_product_subscriber_url
    assert_response :success
  end

  test "should create product_subscriber" do
    assert_difference('ProductSubscriber.count') do
      post product_subscribers_url, params: { product_subscriber: { company_id: @product_subscriber.company_id, is_manager: @product_subscriber.is_manager, is_payer: @product_subscriber.is_payer, product_price_id: @product_subscriber.product_price_id } }
    end

    assert_redirected_to product_subscriber_url(ProductSubscriber.last)
  end

  test "should show product_subscriber" do
    get product_subscriber_url(@product_subscriber)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_subscriber_url(@product_subscriber)
    assert_response :success
  end

  test "should update product_subscriber" do
    patch product_subscriber_url(@product_subscriber), params: { product_subscriber: { company_id: @product_subscriber.company_id, is_manager: @product_subscriber.is_manager, is_payer: @product_subscriber.is_payer, product_price_id: @product_subscriber.product_price_id } }
    assert_redirected_to product_subscriber_url(@product_subscriber)
  end

  test "should destroy product_subscriber" do
    assert_difference('ProductSubscriber.count', -1) do
      delete product_subscriber_url(@product_subscriber)
    end

    assert_redirected_to product_subscribers_url
  end
end
