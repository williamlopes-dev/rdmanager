require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "should not save company without cnpj" do
    c = Company.new
    c.name = "TestName"
    assert_not c.save
  end

  test "should not save company without name" do
    c = Company.new
    c.cnpj = "00.000.000/0000-00"
    assert_not c.save
  end

  test "should not save company with cnpj invalid" do
    c = Company.new
    c.cnpj = "0000000000"
    c.name = "TestName"
    assert_not c.save
  end

  test "should save company correctly" do
    c = Company.new
    c.cnpj = "00.000.000/0000-00"
    c.name = "TestName"
    assert c.save
    assert c.destroy
  end

  test "should save two companies correctly" do
    c1 = Company.new
    c1.cnpj = "00.000.000/0000-00"
    c1.name = "TestName0"
    assert c1.save

    c2 = Company.new
    c2.cnpj = "00.000.000/0000-01"
    c2.name = "TestName1"
    assert c2.save

    assert c1.destroy
    assert c2.destroy
  end

  test "should save the first company only" do
    c1 = Company.new
    c1.cnpj = "00.000.000/0000-00"
    c1.name = "TestName0"
    assert c1.save

    c2 = Company.new
    c2.cnpj = "00.000.000/0000-00"
    c2.name = "TestName1"
    assert_not c2.save

    assert c1.destroy
  end
  
end
