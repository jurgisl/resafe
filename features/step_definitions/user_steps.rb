Given /^there is a user "(.*?)" with password "(.*?)"$/ do |username, password|
  FactoryGirl.create :user, :username => username, :password => password
end

When /^I enter username and password "(.*?)", "(.*?)"$/ do |username, password|
  fill_in "Username", :with => username
  fill_in "Password", :with => password
end

Given /^I am authenticated as a "(.*?)"$/ do |user|
  username = user
  password = "123qwe"
  FactoryGirl.create :user, :username => username, :password => password
  visit url_of "login"
  fill_in "Username", :with => username
  fill_in "Password", :with => password
  click_button "Login"
end
