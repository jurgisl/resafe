When /^(?:|I )press a button "(.*?)"$/ do |label|
  click_button label
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end

When /^I click on a link "(.*?)"$/ do |label|
  click_link label
end
