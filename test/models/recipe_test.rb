require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(
    	        name: "Mongolian Beef", 
    	        summary: "Chicken Corn Soup soooo goood", 
    	        description: "Mongolian Beef served at Fatima Restaurant in Cupertino CA, this stuff is delicious")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
  	@recipe.name = " "
  	assert_not @recipe.valid?
  end
  
  test "name length should not be to long" do   
    @recipe.name = "a"  * 101
    assert_not @recipe.valid?
  end

  test "name length should not be to short" do 
  	@recipe.name = "aaaa"
  	assert_not @recipe.valid?
  end

  test "summary must be present" do 
    @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary should not be to long" do 
  	@recipe.summary = "a" * 151
  	assert_not @recipe.valid?
  end

  test "summary should not be to short" do
    @recipe.summary = "aaaaaaaaa"
    assert_not @recipe.valid? 
  end

  test "description must be present" do
  	@recipe.description = " "
  	assert_not @recipe.valid?
  end

  test "description must not be to long" do 
  	@recipe.description = "a" * 501
  	assert_not @recipe.valid?
  end

  test "description must not be to short" do 
  	@recipe.description = "a" * 19
  	assert_not @recipe.valid?
  end
end