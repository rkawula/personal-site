Feature: Home Page

Scenario: I should see posts on the front page

Given that there is a post in the database with title "First post" and subtitle "Hello world!" in the blog
When I visit the home page
Then I should see the title "First post" and subtitle "Hello world!"

Scenario: There is a pagination button when there are more than 5 posts in the blog

Given that there are more than 5 posts in the database
When I visit the home page
Then I should see 5 post titles and a button "Older Posts"

