Given /^there is a user "(.*?)" with password "(.*?)"$/ do |username, password|
  FactoryGirl.create :user, :username => username, :password => password
end
