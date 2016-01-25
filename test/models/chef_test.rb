require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefname: "John", email: "john@example.com")
	end

	test "chef should be valid" do 
		assert @chef.valid?		
	end

	test "chefname should be present" do
		@chef.chefname = " " 
		assert_not @chef.valid?		
	end

	test "chefname should not be less than 5 characters" do
		@chef.chefname = "aa"
		assert_not @chef.valid? 
	end

	test "chefname should not be more than 50 characters" do
		@chef.chefname = "a" * 51
		assert_not @chef.valid?
	end

	test "email should be valid" do

	end

	test "email should be present" do
		@chef.email = " " 
		assert_not @chef.valid?		
	end

	test "email should be withing bounds" do
		@chef.email = "a" * 100 + "@example.com"
		assert_not @chef.valid? 
	end

	test "email should be unique" do
		chef_dup = @chef.dup
		chef_dup.email = @chef.email.upcase
		@chef.save
		assert_not chef_dup.valid?
	end

	test "email should accept valid address" do
		valid_address = %w[edmondtm@yahoo.com R_TDO-DS@mail.anythingscientific.com user@examples.com first.last@gmail.com]
		valid_address.each do |va|
			@chef.email = va
			assert @chef.valid? '#{va.inspect} should be valid'
		end
	end

	test "email should reject invalid address" do
		invalid_address = %w[abc@abc@abc.com abc@abc abc.abc.com abc@abc. 'abc<script>@</script>.com']
		invalid_address.each do |ia|
			@chef.email = ia
			assert_not @chef.valid? '#{ia.inspect} should be invalid'

		end

	end


end

