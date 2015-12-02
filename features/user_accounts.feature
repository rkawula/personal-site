Feature: User accounts

	Scenario: Login page has entry fields for name & password.

	Given that I am not logged in
	When I visit the "login" page
	Then I see a textbox labeled "Username"
	And I see a textbox labeled "Password"

	Scenario: Error when wrong log-in info.

	Given that I am not logged in
	And that a user with username "abcdefg" and password "abcdefg" does not exist
	When I visit the "login" page
	And I enter "abcdefg" in the textbox "session_username"
	And I enter "abcdefg" in the textbox "session_password"
	And I press "Log in"
	Then I should see an error "Invalid email/password."

	Scenario: Log-in is successful.

	Given that I am not logged in
	And that a user exists with username "abcdefg" and password "abcdefg"
	When I visit the "login" page
	And I enter "abcdefg" in the textbox "session_username"
	And I enter "abcdefg" in the textbox "session_password"
	And I press "Log in"
	Then I should see "Welcome, abcdefg!"

	Scenario: Admin can see admin page.

	Given that I am logged in as "administrator"
	When I visit the "admin" page
	Then I should see "Administrator"

	Scenario: Visitors can't see admin page.

	Given that I am not logged in
	When I visit the "admin" page
	Then I should see "Error: restricted access!"

	Scenario: Non-admins can't see admin page.

	Given that I am logged in as "nonadministrator"
	When I visit the "admin" page
	Then I should see "Error: restricted access!"

