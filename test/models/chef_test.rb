require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Donkey Chef", email: "donkey@donkeychef.com")
  end
  
  test "chef should be valid" do 
    assert @chef.valid?
  end

  test "chefname should be present" do 
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname should not be to long" do 
    @chef.chefname = "a" * 41
    assert_not @chef.valid?  
  end
  
  test "chefname should not be to short" do 
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "email should be present" do 
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end

  test "email address should be unique" do 
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
    valid_addresses.each do |valid|
      @chef.email = valid
      assert @chef.valid?, "#{valid.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am.com foo@ee+aar.com]
    invalid_addresses.each do |invalid|
      @chef.email = invalid
      assert_not @chef.valid?, "#{invalid.inspect} should not be valid"
    end    
  end

end