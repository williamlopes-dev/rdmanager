require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase

  test "should not save currency without name" do
    c = Currency.new
    assert_not c.save
  end

  test "should save currency correctly" do
    c = Currency.new
    c.name = "JPY"
    assert c.save
    assert c.destroy
  end

  test "should save two currencies correctly" do
    c1 = Currency.new
    c1.name = "JPY"
    assert c1.save

    c2 = Currency.new
    c2.name = "CHF"
    assert c2.save

    assert c1.destroy
    assert c2.destroy
  end

  test "should save the first currency only" do
    c1 = Currency.new
    c1.name = "JPY"
    assert c1.save

    c2 = Currency.new
    c2.name = "JPY"
    assert_not c2.save

    assert c1.destroy
  end

end
