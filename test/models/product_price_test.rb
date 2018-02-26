require 'test_helper'

class ProductPriceTest < ActiveSupport::TestCase

  setup do
    @product = products(:product_a_company_d)
    @currency = currencies(:currency_brl)
    @currency_extra1 = currencies(:currency_usd)
    @currency_extra2 = currencies(:currency_ars)
  end

  test "should not save product_price without product, price and currency" do
    pp = ProductPrice.new
    assert_not pp.save
  end

  test "should not save product_price without product and currency" do
    pp = ProductPrice.new
    pp.price = 1000
    assert_not pp.save
  end

  test "should not save product_price without currency" do
    pp = ProductPrice.new
    pp.product = @product
    pp.price = 1000
    assert_not pp.save
  end

  test "should not save product_price without product" do
    pp = ProductPrice.new
    pp.currency = @currency
    pp.price = 1000
    assert_not pp.save
  end

  test "should save product_price correctly" do
    pp = ProductPrice.new
    pp.product = @product
    pp.currency = @currency
    pp.price = 1000
    assert pp.save
    assert pp.destroy
  end

  test "should save two product_prices correctly" do
    pp1 = ProductPrice.new
    pp1.product = @product
    pp1.currency = @currency
    pp1.price = 1000
    assert pp1.save

    pp2 = ProductPrice.new
    pp2.product = @product
    pp2.currency = @currency_extra1
    pp2.price = 2000
    assert pp2.save

    assert pp1.destroy
    assert pp2.destroy
  end

  test "should save the first product_price only" do
    pp1 = ProductPrice.new
    pp1.product = @product
    pp1.currency = @currency
    pp1.price = 1000
    assert pp1.save

    pp2 = ProductPrice.new
    pp2.product = @product
    pp2.currency = @currency
    pp2.price = 2000
    assert_not pp2.save

    assert pp1.destroy
  end

  test "should not save without relantionship between company and currency" do
    pp = ProductPrice.new
    pp.product = @product
    pp.currency = @currency_extra2
    pp.price = 2000
    assert_not pp.save
  end

end
