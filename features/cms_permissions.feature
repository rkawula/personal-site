Feature: Content Management System

Description: The content management system (CMS) should allow the administrator to make new, formatted posts on the blog. Eventually, the CMS will be used to edit the About Me, Resume, and Project pages.

	Scenario: Navigation is special for administrator.

	Given that I am logged in as "nonadministrator"
	When I visit the "home" page
	Then I should not see "Admin"

	Given that I am logged in as "administrator"
	When I visit the "home" page
	Then I should see "Admin"
	And I should see "Log out"

	Scenario: Admin page has special links.

	Given that I am logged in as "administrator"
	When I visit the "admin" page
	Then I should see an "Edit content" section
	And I should see links "Start Blog Post", "Continue Blog Post", "About", "Resume", and "Projects".

	Scenario: Nonadmin and visitors see restricted message on admin page.

	Given that I am logged in as "nonadministrator"
	When I visit the "new post" page
	Then I should see "Go away"
	And I should see "Error: restricted access!"

	Given that I am not logged in
	When I visit the "new post" page
	Then I should see "Go away"
	And I should see "Error: restricted access!"