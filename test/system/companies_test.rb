require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit companies_url

    assert_selector "h1", text: "Companies"

    company = companies(:one)
    assert_selector "td", text: company.cnpj
    assert_selector "td", text: company.name
  end

  test "visiting the one company" do
    company = companies(:one)

    visit company_url(company)

    assert_selector "p", text: company.cnpj
    assert_selector "p", text: company.name
  end

  test "adding new company" do
    company = companies(:one)
    assert company.destroy

    visit new_company_path

    fill_in "Cnpj", with: company.cnpj
    fill_in "Name", with: company.name

    click_on "Create Company"

    assert_text "Company was successfully created."
  end
end
