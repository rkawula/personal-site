Then(/^I should see links to edit the "(.*?)", "(.*?)", "(.*?)", and "(.*?)"\.$/) do |arg1, arg2, arg3, arg4|
  expect(page).to have_content arg1
  expect(page).to have_content arg2
  expect(page).to have_content arg3
  expect(page).to have_content arg4
end