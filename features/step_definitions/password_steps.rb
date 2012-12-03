
Then /^I should see password form$/ do
  page.should have_css "form.new_password"
end

When /^I enter password named "(.*?)"$/ do |name|
  fill_in "Name", :with => name
  fill_in "Description", :with => "Some password"
  fill_in "Password", :with =>"SomeSecret"
end

Given /^there is password "(.*?)" with category "(.*?)"$/ do |name, category_name|
  category = Category.find_by_name category_name
  FactoryGirl.create :password, :name => name, :category => category
end
