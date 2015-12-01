Feature: User accounts

Scenario: I should be able to login

Given that I am not logged in
When I visit the "login" page
Then I see a textbox labeled "Username"
And I see a textbox labeled "Password"

Given that I am not logged in
And that a user with username "abcdefg" and password "abcdefg" does not exist
When I visit the "login" page
And I enter "abcdefg" in the textbox labeled "Username"
And I enter "abcdefg" in the textbox labeled "Password"
And I click "Submit"
Then I should see an error "Invalid email/password."