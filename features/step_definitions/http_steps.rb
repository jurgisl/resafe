Given /^I am on page "(.*?)"$/ do |page|
  visit url_of page
end

Then /^I should be on page "(.*?)"$/ do |page|
  current_path = URI.parse(current_url).path
  current_path.should == url_of(page)
end