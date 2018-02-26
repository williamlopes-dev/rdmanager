require "application_system_test_case"

class CurrenciesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit currencies_url

    assert_selector "h1", text: "Currencies"

    currency = currencies(:currency_ars)
    assert_selector "td", text: currency.name

    currency = currencies(:currency_brl)
    assert_selector "td", text: currency.name

    currency = currencies(:currency_usd)
    assert_selector "td", text: currency.name
  end

  test "visiting the currency brl" do
    currency = currencies(:currency_brl)

    visit currency_url(currency)

    assert_selector "p", text: currency.name
  end

  test "adding new company" do
    currency = currencies(:currency_gbp)
    assert currency.destroy

    visit new_currency_path

    fill_in "Name", with: currency.name

    click_on "Create Currency"

    assert_text "Currency was successfully created."
  end

end
