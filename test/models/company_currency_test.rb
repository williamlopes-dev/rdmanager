require 'test_helper'

class CompanyCurrencyTest < ActiveSupport::TestCase

  setup do
    @company = companies(:company_d)
    @currency = currencies(:currency_gbp)
    @currency_extra = currencies(:currency_ars)
  end

  test "should not save company_currency without decimal places, company and currency" do
    cc = CompanyCurrency.new
    assert_not cc.save
  end

  test "should not save company_currency without company and currency" do
    cc = CompanyCurrency.new
    cc.decimal_places = 2
    assert_not cc.save
  end

  test "should not save company_currency without currency" do
    cc = CompanyCurrency.new
    cc.company = @company
    cc.decimal_places = 2
    assert_not cc.save
  end

  test "should not save company_currency without company" do
    cc = CompanyCurrency.new
    cc.currency = @currency
    cc.decimal_places = 2
    assert_not cc.save
  end

  test "should save company_currency correctly" do
    cc = CompanyCurrency.new
    cc.company = @company
    cc.currency = @currency
    cc.decimal_places = 2
    assert cc.save
    assert cc.destroy
  end

  test "should save two company_currencies correctly" do
    cc1 = CompanyCurrency.new
    cc1.company = @company
    cc1.currency = @currency
    cc1.decimal_places = 2
    assert cc1.save

    cc2 = CompanyCurrency.new
    cc2.company = @company
    cc2.currency = @currency_extra
    cc2.decimal_places = 2
    assert cc2.save

    assert cc1.destroy
    assert cc2.destroy
  end

  test "should save the first company_currency only" do
    cc1 = CompanyCurrency.new
    cc1.company = @company
    cc1.currency = @currency
    cc1.decimal_places = 2
    assert cc1.save

    cc2 = CompanyCurrency.new
    cc2.company = @company
    cc2.currency = @currency
    cc2.decimal_places = 2
    assert_not cc2.save

    assert cc1.destroy
  end

end
