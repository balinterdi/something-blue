@users
Feature: Logging into the site
  In order to use the site's only-for-users features
  As a registered user
  I want to log in
  
  Scenario: User provides correct credentials
  Given there is a user called "leonhard"
  And the user called "leonhard" has the password "sickrat"
  When I go to the login page
  And I fill in the login field with "leonhard"
  And I fill in the password field with "sickrat"
  And I press "Log in"
  Then I should see "You are now logged in"
  And I should see "leonhard"