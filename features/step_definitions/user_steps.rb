Given /^there is a user "(.*?)" with password "(.*?)"$/ do |username, password|
  FactoryGirl.create :user, :username => username, :password => password
end

When /^I enter username and password "(.*?)", "(.*?)"$/ do |username, password|
  fill_in :username, :with => username
  fill_in :password, :with => password
end
