require "application_system_test_case"

class GroupedSubscribersTest < ApplicationSystemTestCase

  test "visiting the index of subscriber managers" do
    visit grouped_subscribers_managers_url

    assert_selector "h1", text: "Subscribers - Managers"
    assert_selector "h4", text: "Empresa A"
    assert_selector "td", text: "Produto B"
    assert_selector "td", text: "Produto C"
    assert_selector "h4", text: "Empresa D"
    assert_text "Currency: ARS | Total value: 45000.00"
    assert_text "Currency: BRL | Total value: 4500.00"
  end

  test "visiting the index of subscriber payers" do
    visit grouped_subscribers_payers_url

    assert_selector "h1", text: "Subscribers - Payers"
    assert_selector "h4", text: "Empresa A"
    assert_selector "td", text: "Produto B"
    assert_selector "td", text: "Produto C"
    assert_selector "h4", text: "Empresa D"
    assert_text "Currency: ARS | Total value: 3000.00"
    assert_text "Currency: BRL | Total value: 300.00"
  end

end
