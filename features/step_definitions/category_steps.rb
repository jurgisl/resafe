
Given /^there are categories:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |category|
    parent = Category.find_by_name category["Parent"]
    FactoryGirl.create :category, :name => category["Name"], :parent => parent
  end
end