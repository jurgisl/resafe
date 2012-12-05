
When /^I enter password named "(.*?)"$/ do |name|
  fill_in "Name", :with => name
  fill_in "Description", :with => "Some password"
  fill_in "Password", :with =>"SomeSecret"
end

Given /^there is password "(.*?)" with category "(.*?)"$/ do |name, category_name|
  category = Category.find_by_name category_name
  FactoryGirl.create :password, :name => name, :category => category
end

Given /^there is password "(.*?)" with secret "(.*?)" and category "(.*?)"$/ do |name, secret, category_name|
  category = Category.find_by_name category_name
  FactoryGirl.create :password, :name => name, :password => secret, :category => category
end

When /^I am on a passwords category "(.*?)"$/ do |category_name|
  category = Category.find_by_name category_name
  visit url_of("passwords") + "?category=#{category.id}"
end
