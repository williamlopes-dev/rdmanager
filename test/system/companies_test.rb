require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit companies_url

    assert_selector "h1", text: "Companies"

    company = companies(:company_a)
    assert_selector "td", text: company.cnpj
    assert_selector "td", text: company.name

    company = companies(:company_b)
    assert_selector "td", text: company.cnpj
    assert_selector "td", text: company.name

    company = companies(:company_c)
    assert_selector "td", text: company.cnpj
    assert_selector "td", text: company.name
  end

  test "visiting the company company_a" do
    company = companies(:company_a)

    visit company_url(company)

    assert_selector "h5", text: company.cnpj
    assert_selector "h5", text: company.name
  end

  test "adding new company" do
    company = companies(:company_d)
    assert company.destroy

    visit new_company_path

    fill_in "Cnpj", with: company.cnpj
    fill_in "Name", with: company.name

    click_on "Create Company"

    assert_text "Company was successfully created."
  end

end
