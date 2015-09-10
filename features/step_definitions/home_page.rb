Given(/^that there is a post in the database with title "(.*?)" and subtitle "(.*?)" in the blog$/) do |title, subtitle|
  Post.create title: title, subtitle: subtitle
end

When(/^I visit the home page$/) do
  visit root_path
end

Then(/^I should see the title "(.*?)" and subtitle "(.*?)"$/) do |title, subtitle|
  expect(page).to have_content title
  expect(page).to have_content subtitle
end

Given(/^that there are more than (\d+) posts in the database$/) do |post_count|
  (post_count.to_i + 1).times do |i|
  	Post.create title: i.to_s
  end
end

Then(/^I should see (\d+) post titles and a button "(.*?)"$/) do |post_count, pagination_button|
  expect(page).to have_content pagination_button
  (post_count.to_i + 1).times do |i|
    expect(page).to have_content i.to_s
  end
end

Given(/^that there is a post in the database with author "(.*?)" and created at date "(.*?)"$/) do |author, created_at_date|
  Post.create author: author
end

Then(/^I should see the author "(.*?)" and created at date "(.*?)"$/) do |author, created_at_date|
  expect(page).to have_content author # Make this specific so it doesn't pass due to copyright at the bottom of the page
  expect(page).to have_content created_at_date
end