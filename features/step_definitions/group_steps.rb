
Given /^there is a group "(.*?)"$/ do |group_name|
  FactoryGirl.create :group, :name => group_name
end