require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase

  test "visiting the index" do
    company = companies(:company_a)
    visit company_products_url(company)

    assert_selector "h1", text: "Products"

    product = products(:product_a_company_a)
    assert_selector "td", text: product.name

    product = products(:product_b_company_a)
    assert_selector "td", text: product.name
  end

  test "visiting the product product_a" do
    company = companies(:company_a)
    product = products(:product_a_company_a)

    visit company_product_url(company, product)

    assert_selector "p", text: product.name
  end

  test "adding new product" do
    company = companies(:company_d)
    currency = currencies(:currency_usd)
    product = products(:product_a_company_d)
    assert product.destroy

    visit new_company_product_path(company)

    fill_in "Name", with: product.name

    click_on "add price"

    fill_in "product_price_price", with: "12345"

    click_on "Create Product"

    assert_text "Product was successfully created."
  end

end
