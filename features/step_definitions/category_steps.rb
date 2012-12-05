
Given /^there are categories:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    parent = Category.find_by_name row["Parent"]
    category = FactoryGirl.create :category, :name => row["Name"], :parent => parent
    category.groups = Group.where(:name => row["Groups"])
  end
end

Given /^there is a category "(.*?)"$/ do |name|
  FactoryGirl.create :category, :name => name
end

Then /^I should see category form$/ do
  page.should have_css "form.new_category"
end

Given /^category "(.*?)" is accessible by "(.*?)" group$/ do |category_name, group_name|
  category = Category.find_by_name category_name
  group = Group.find_by_name group_name
  category.groups.push group
end
