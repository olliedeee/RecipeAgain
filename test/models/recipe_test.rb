require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(name: "Fly to the moon", description: "Travel to the moon and walk on its surface")
  end
  
  
  test 'recipe should be valid' do
    assert @recipe.valid?
  end
  
  test 'name should be present' do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test 'description should be present' do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test 'description not <5 chars' do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?

  end
  
  test 'name not <5 chars' do
    @recipe.name = "a" * 3
    assert_not @recipe.valid?

  end
  
   test 'name not >240 chars' do
    @recipe.name = "a" * 241
    assert_not @recipe.valid?
  end
  
  test 'description not >500 chars' do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
    
  
end




