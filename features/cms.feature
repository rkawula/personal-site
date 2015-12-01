Feature: Content Management System

Description: The content management system (CMS) should allow the administrator to make new, formatted posts on the blog. Eventually, the CMS will be used to edit the About Me, Resume, and Project pages.

Scenario: Navigation.

Given that I am logged in as "administrator"
When I visit the "admin" page
Then I should see links to edit the "Blog", "About", "Resume", and "Projects".

Given that I am logged in as "administrator"
When I visit the "home" page
Then I should see "Admin"
And I should see "Log out"

Given that I am logged in as "nonadministrator"
When I visit the "new post" page
Then I should see "Go away"
And I should see "Error: restricted access!"

Given that I am logged in as "administrator"
When I visit the "new post" page
Then I see a textbox labeled "Title"
And I see a textbox labeled "Subtitle"
And I see a textbox labeled "Content"