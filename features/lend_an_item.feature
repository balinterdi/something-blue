@current
Feature: Lend an item
  In order to keep track of what I have lent
  As a user
  I want to register the fact of lending
  
  Scenario: User registers a lending
  Given there is a user called "alice"
  And there is a user called "bob"
  And I am logged in as "alice"
  When I go to the new lending page
  And I fill in the lending's title with "My favorite worst nightmare"
  And I select "CD" from "category"
  And I select "2 weeks" from "time"
  And I select "bob" from "lending[to_id]"
  And I press "Save"
  Then I should see "Lending saved"
  And I should see "My favorite worst nightmare"