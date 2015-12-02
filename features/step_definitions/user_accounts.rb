Given(/^that I am not logged in$/) do
  visit logout_path
end

When(/^I visit the "(.*?)" page$/) do |webpage|
  if webpage == 'login'
    to_visit = login_path
  elsif webpage == 'admin'
    to_visit = admin_path
  elsif webpage == 'new post'
    to_visit = new_post_path
  elsif webpage == 'home'
    to_visit = root_path
  elsif webpage == 'continue'
    to_visit = continue_post_path
  end
  visit to_visit
end

Given(/^that a user with username "(.*?)" and password "(.*?)" does not exist$/) do |username, password|
  User.delete_all
end

Then(/^I see a textbox labeled "(.*?)"$/) do |label|
  expect(page).to have_content label
end

When(/^I enter "(.*?)" in the textbox "(.*?)"$/) do |data, textbox|
  fill_in textbox, with: data
end

When(/^I press "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see an error "(.*?)"$/) do |error|
  expect(page).to have_content error
end

Given(/^that a user exists with username "(.*?)" and password "(.*?)"$/) do |username, password|
  User.create username: username, password: password,
              password_confirmation: password, email: 'whatever@gmail.com'
end

Then(/^I should see "(.*?)"$/) do |welcome|
  expect(page).to have_content welcome
end

Given(/^that I am logged in as "(.*?)"$/) do |user|
  visit login_path
  User.create username: user, password: user, password_confirmation: user,
              email: user + '@gmail.com', admin: (user == 'administrator')
  fill_in 'session_username', with: user
  fill_in 'session_password', with: user
  click_button 'Log in'
  expect(page).to have_content 'Welcome'
end