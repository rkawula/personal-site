Given(/^that I am at the home page$/) do
  visit root_path
end

Then(/^I should be at the "(.*?)" webpage$/) do |arg1|
  expect(page).to have_content 'Projects'
end