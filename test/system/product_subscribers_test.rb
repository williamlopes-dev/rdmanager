require "application_system_test_case"

class ProductSubscribersTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit product_subscribers_url

    assert_selector "h1", text: "Product Subscribers"

    product_subscriber = product_subscribers(:product_subscriber_a)
    assert_selector "td", text: product_subscriber.company.full_name

    product_subscriber = product_subscribers(:product_subscriber_b)
    assert_selector "td", text: product_subscriber.product_price.price_formatted

    product_subscriber = product_subscribers(:product_subscriber_c)
    assert_selector "td", text: product_subscriber.product_price.product.company.full_name
  end

  test "visiting the product subscriber product_subscriber_a" do
    product_subscriber = product_subscribers(:product_subscriber_a)

    visit product_subscriber_url(product_subscriber)

    assert_selector "p", text: product_subscriber.company.full_name
    assert_selector "p", text: product_subscriber.product_price.full_name
  end

  test "adding new product" do
    product_subscriber = product_subscribers(:product_subscriber_a)
    assert product_subscriber.destroy

    visit new_product_subscriber_path

    select product_subscriber.product_price.full_name, from: "product_subscriber_product_price_id"
    select product_subscriber.company.full_name, from: "product_subscriber_company_id"
    check "product_subscriber_is_manager"
    uncheck "product_subscriber_is_payer"

    click_on "Create Product subscriber"

    assert_text "Product subscriber was successfully created."

  end

end
