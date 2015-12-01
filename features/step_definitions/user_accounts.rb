Given(/^that I am not logged in$/) do
  visit root_path
  expect(page).to have_content 'Log in'
end

When(/^I visit the "(.*?)" page$/) do |webpage|
  if webpage == 'login'
    to_visit = login_path
  end
  visit to_visit
end

Then(/^I see a textbox labeled "(.*?)"$/) do |label|
  expect(page).to have_content label
end

When(/^I enter "(.*?)" in the textbox labeled "(.*?)"$/) do |data, textbox|
  fill_in textbox, with: data
end

When(/^I click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an error "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end