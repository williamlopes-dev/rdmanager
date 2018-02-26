require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:product_a_company_d)
    @company = companies(:company_d)
  end

  test "should get index" do
    get company_products_url(@company)
    assert_response :success
  end

  test "should get new" do
    get new_company_product_url(@company)
    assert_response :success
  end

  test "should create product" do
    assert @product.destroy

    assert_difference('Product.count') do
      post company_products_url(@company), params: { product: { company_id: @product.company_id, name: @product.name } }
    end

    assert_redirected_to company_product_url(@company, Product.last)
  end

  test "should show product" do
    get company_product_url(@company, @product)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_product_url(@company, @product)
    assert_response :success
  end

  test "should update product" do
    patch company_product_url(@company, @product), params: { product: { company_id: @product.company_id, name: @product.name } }
    assert_redirected_to company_product_url(@company, @product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete company_product_url(@company, @product)
    end

    assert_redirected_to company_products_url(@company)
  end
end
