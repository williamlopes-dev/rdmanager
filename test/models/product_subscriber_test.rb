require 'test_helper'

class ProductSubscriberTest < ActiveSupport::TestCase

  setup do
    @company = companies(:company_d)
    @product_price1 = product_prices(:product_a_company_e_price_brl)
    @product_price2 = product_prices(:product_a_company_e_price_usd)
  end

  test "should not save product_subscriber without company, product price, is manager option and is payer option" do
    ps = ProductSubscriber.new
    assert_not ps.save
  end

  test "should not save product_subscriber without company and product price" do
    ps = ProductSubscriber.new
    ps.is_manager = true
    ps.is_payer = false
    assert_not ps.save
  end

  test "should not save product_subscriber without company" do
    ps = ProductSubscriber.new
    ps.is_manager = true
    ps.is_payer = false
    ps.product_price = @product_price1
    assert_not ps.save
  end

  test "should not save product_subscriber without product price" do
    ps = ProductSubscriber.new
    ps.is_manager = true
    ps.is_payer = false
    ps.company = @company
    assert_not ps.save
  end

  test "should save product_subscriber correctly" do
    ps = ProductSubscriber.new
    ps.is_manager = true
    ps.is_payer = false
    ps.company = @company
    ps.product_price = @product_price1
    assert ps.save
    assert ps.destroy
  end

  test "should save two product_subscribers correctly" do
    ps1 = ProductSubscriber.new
    ps1.is_manager = true
    ps1.is_payer = false
    ps1.company = @company
    ps1.product_price = @product_price1
    assert ps1.save

    ps2 = ProductSubscriber.new
    ps2.is_manager = false
    ps2.is_payer = true
    ps2.company = @company
    ps2.product_price = @product_price2
    assert ps2.save

    assert ps1.destroy
    assert ps2.destroy
  end

  test "should save the first product_subscriber only" do
    ps1 = ProductSubscriber.new
    ps1.is_manager = true
    ps1.is_payer = false
    ps1.company = @company
    ps1.product_price = @product_price1
    assert ps1.save

    ps2 = ProductSubscriber.new
    ps2.is_manager = false
    ps2.is_payer = true
    ps2.company = @company
    ps2.product_price = @product_price1
    assert_not ps2.save

    assert ps1.destroy
  end

end
