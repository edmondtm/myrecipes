require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@recipe = Recipe.new(name: "chicken pharm", summary: "This is the best chicken recipe ever", 
			description: "Heat oil, add tomatoes, add chicken, cook for 20 minutes.")
	end

	test "Recipe should be valid" do
		assert @recipe.valid?
	end

	test "Name is present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "Name is more than 5 characters" do
		@recipe.name = "aaaa"
		assert_not @recipe.valid?
	end

	test "Name is less than 100 characters" do
		@recipe.name = "a" * 101
		assert_not @recipe.valid?
	end

	test "Summary is present" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end

	test "Summary is more than 10 characters" do
		@recipe.summary = "a" * 9
		assert_not @recipe.valid?
	end

	test "Summary should be less than 150 words" do
		@recipe.summary = "a" * 151
		assert_not @recipe.valid?
	end

	test "Description should be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end

	test "Description should be more than 20 characters" do
		@recipe.description = "a" * 19
		assert_not @recipe.valid?
	end

	test "Description should not be more than 500 characters" do
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end

end