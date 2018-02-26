require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @company = companies(:company_d)
  end

  test "should not save product without company and name" do
    p = Product.new
    assert_not p.save
  end

  test "should not save company_currency without company" do
    p = Product.new
    p.name = "ProductName"
    assert_not p.save
  end

  test "should not save company_currency without name" do
    p = Product.new
    p.company = @company
    assert_not p.save
  end

  test "should save company_currency correctly" do
    p = Product.new
    p.company = @company
    p.name = "ProductName"
    assert p.save
    assert p.destroy
  end

  test "should save two company_currencies correctly" do
    p1 = Product.new
    p1.company = @company
    p1.name = "ProductName1"
    assert p1.save

    p2 = Product.new
    p2.company = @company
    p2.name = "ProductName2"
    assert p2.save

    assert p1.destroy
    assert p2.destroy
  end

  test "should save the first company_currency only" do
    p1 = Product.new
    p1.company = @company
    p1.name = "ProductName"
    assert p1.save

    p2 = Product.new
    p2.company = @company
    p2.name = "ProductName"
    assert_not p2.save

    assert p1.destroy
  end

end
