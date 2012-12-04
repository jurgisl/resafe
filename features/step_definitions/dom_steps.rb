When /^(?:|I )press a button "(.*?)"$/ do |label|
  click_button label
end

Then /^I should (not )?see "(.*?)"$/ do |no, text|
  if no.nil?
    page.should have_content text
  else
    page.should_not have_content text
  end
end

Then /^I should (not )?see link "(.*?)"$/ do |no, text|
  if no.nil?
    page.should have_link text
  else
    page.should_not have_link text
  end
end

When /^I click on a link "(.*?)"$/ do |label|
  click_link label
end

Given /^I enter "(.*?)" in field "(.*?)"$/ do |value, field|
  fill_in field, :with => value
end
