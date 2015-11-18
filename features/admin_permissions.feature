Feature: Admin permissions

Scenario: I should be able to login

Given that I am not logged in
When I visit the "login" page
Then I see a textbox labeled "Username"
And I see a textbox labeled "Password"