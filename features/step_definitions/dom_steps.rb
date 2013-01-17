When /^(?:|I )press a button "(.*?)"$/ do |label|
  click_button label
end

Then /^(?:|I )should (not )?see "(.*?)"$/ do |no, text|
  if no.nil?
    page.should have_content text
  else
    page.should_not have_content text
  end
end

Then /^(?:|I )should (not )?see link "(.*?)"$/ do |no, text|
  if no.nil?
    page.should have_link text
  else
    page.should_not have_link text
  end
end

When /^(?:|I )click on a link "([^\"]*?)"$/ do |label|
  click_link label
end

Given /^(?:|I )enter "(.*?)" in field "(.*?)"$/ do |value, field|
  fill_in field, :with => value
end

When /^(?:|I )select "(.*?)" from select "(.*?)"$/ do |option, select|
  select option, :from => select
end

Then /^(?:|I )should see "(.*?)" form$/ do |form_name|
  case form_name
  when "new password"
    page.should have_css "form.new_password"
  when "new category"
    page.should have_css "form.new_category"
  when "edit category"
    page.should have_css "form.edit_category"
  when "new user"
    page.should have_css "form.new_user"
  when "new group"
    page.should have_css "form.new_group"
  else
    throw "Unknown form"
  end
end

When /^(?:|I )close the popup$/ do
  find('.modal .modal-footer .btn').click()
end
