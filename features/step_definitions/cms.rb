Then(/^I should see links "(.*?)", "(.*?)", "(.*?)", "(.*?)", and "(.*?)"\.$/) do |arg1, arg2, arg3, arg4, arg5|
  expect(page).to have_content arg1
  expect(page).to have_content arg2
  expect(page).to have_content arg3
  expect(page).to have_content arg4
  expect(page).to have_content arg5

end

Then(/^I should see an "(.*?)" section$/) do |header|
  expect(page).to have_content header
end

Then(/^I should not see "(.*?)"$/) do |item|
	expect(page).to_not have_content item
end

Then(/^I see a checkbox labeled "(.*?)"$/) do |item|
	expect(page).to have_content item
end

When(/^I write "(.*?)" in "(.*?)"$/) do |data, field|
  fill_in field, with: data
end

When(/^I check "(.*?)"$/) do |box|
  check box
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end

Then(/^I should see "(.*?)" (\d+) times$/) do |data, count|
  expect(page).to have_content data, count: count
end

Then(/^I should see the author, "(.*?)"$/) do |author|
  expect(page).to have_content author
end

Given(/^I am at the "(.*?)" page$/) do |webpage|
  if webpage == 'admin'
    to_visit = admin_path
  end
  visit to_visit
end

Given(/^there are (\d+) incomplete posts in the database$/) do |count|
   count.to_i.times do |i|
    title = "Content! " + i.to_s
    Post.create title: title, slug: Post.format_slug(title), visible: false
  end
end

Given(/^there are (\d+) complete posts in the database$/) do |count|
   count.to_i.times do |i|
    title = "Content! " + i.to_s
    Post.create title: title, slug: Post.format_slug(title), visible: true
  end
end

Then(/^I should see (\d+) incomplete blog posts$/) do |count|
  expect(page).to have_content 'Content!', count: count
end

When(/^I click on the first post$/) do
  click_link "Content! 1"
end

Given(/^there is a post with title "(.*?)", subtitle "(.*?)", content "(.*?)", and visibility is "(.*?)"$/) do |title, subtitle, content, visibility|
  vis = false
  vis = true if visibility == "true"
  Post.create title: title, slug: Post.format_slug(title), subtitle: subtitle, content: content, visible: vis
end

When(/^I visit the edit page for the post with title "(.*?)"$/) do |title|
  visit edit_post_path(Post.find_by title: title)
end

Then(/^I see the "(.*?)" textbox with "(.*?)"$/) do |label, data|
  expect(page).to have_field label, with: data
end

Given(/^I am at the edit page for the post with title "(.*?)"$/) do |title|
  visit edit_post_path(Post.find_by title: title)
end

Given(/^I uncheck "(.*?)"$/) do |box|
  uncheck box
end

Then(/^"(.*?)" should be gone from the database$/) do |post_title|
  expect(Post.find_by(title: post_title)).to be nil
end