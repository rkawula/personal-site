Feature: Blog Content Management System.

	Scenario: New posts have required fields provided.

	Given that I am logged in as "administrator"
	When I visit the "new post" page
	Then I see a textbox labeled "Title"
	And I see a textbox labeled "Subtitle"
	And I see a textbox labeled "Content"
	And I see a checkbox labeled "Visible"

	Scenario: Make a new post.

	Given that I am logged in as "administrator"
	When I visit the "new post" page
	And I write "Testing!" in "Title"
	And I write "Testing!" in "Subtitle"
	And I write "Testing!" in "Content"
	And I check "Visible"
	And I press "Submit"
	Then I should see "Success creating post"
	And I should see "Testing!" 3 times
	And I should see the author, "administrator"

	Scenario: Make a hidden post.

	Given that I am logged in as "administrator"
	When I visit the "new post" page
	And I write "Testing!" in "Title"
	And I write "Testing!" in "Subtitle"
	And I write "Testing!" in "Content"
	And I press "Submit"
	Then I should see "Success creating post"
	And I should not see "Testing!"

	Scenario: See incomplete posts.

	Given that I am logged in as "administrator"
	And there are 2 incomplete posts in the database
	And there are 7 complete posts in the database
	And I am at the "admin" page
	When I click "Continue Blog Post"
	Then I should see 2 incomplete blog posts

	Scenario: Select post to edit.

	Given that I am logged in as "administrator"
	And there are 3 incomplete posts in the database
	When I visit the "continue" page
	And I click on the first post
	Then I see a textbox labeled "Title"
	And I see a textbox labeled "Subtitle"
	And I see a textbox labeled "Content"
	And I see a checkbox labeled "Visible"

	Given that I am logged in as "administrator"
	And there is a post with title "NYI", subtitle "TBD", content "Incomplete", and not visible
	When I visit the edit page for the post with title "NYI"
	Then I see the "Title" textbox with "NYI"
	And I see the "Subtitle" textbox with "TBD"
	And I see the "Content" textbox with "Incomplete"
	And I see a checkbox labeled "Visible"

	Scenario: Edit post and publish.

	Given that I am logged in as "administrator"
	And there is a post with title "NYI", subtitle "TBD", content "Incomplete", and not visible
	And I am at the edit page for the post with title "NYI"
	And I write "Testing!" in "Title"
	And I write "Testing!" in "Subtitle"
	And I write "Testing!" in "Content"
	And I check "Visible"
	When I press "Submit"
	Then I should see "Posted!"
	And I should see "Testing!" 3 times
	And I should see the author, "administrator"

	Scenario: Edit post and don't publish.

	Given that I am logged in as "administrator"
	And there is a post with title "NYI", subtitle "TBD", content "Incomplete", and not visible
	And I am at the edit page for the post with title "NYI"
	And I write "Testing!" in "Title"
	And I write "Testing!" in "Subtitle"
	And I write "Testing!" in "Content"
	And I uncheck "Visible"
	When I press "Submit"
	Then I should see "Changes saved."
	And I should see "Posts in progress"
	And I should see "Testing!"