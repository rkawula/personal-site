Feature: User accounts

Scenario: I should be able to login

Given that I am not logged in
When I visit the "login" page
Then I see a textbox labeled "Username"
And I see a textbox labeled "Password"

Given that I am not logged in
And that a user with username "abcdefg" and password "abcdefg" does not exist
When I visit the "login" page
And I enter "abcdefg" in the textbox "session_username"
And I enter "abcdefg" in the textbox "session_password"
And I click "Log in"
Then I should see an error "Invalid email/password."

Given that I am not logged in
And that a user exists with username "abcdefg" and password "abcdefg"
When I visit the "login" page
And I enter "abcdefg" in the textbox "session_username"
And I enter "abcdefg" in the textbox "session_password"
And I click "Log in"
Then I should see "Welcome, abcdefg!"

Scenario: Only admin can see admin page

Given that I am logged in as "administrator"
When I visit the "admin" page
Then I should see "Administrator"

Given that I am not logged in
When I visit the "admin" page
Then I should see "Error: restricted access!"

Given that I am logged in as "nonadministrator"
When I visit the "admin" page
Then I should see "Error: restricted access!"

