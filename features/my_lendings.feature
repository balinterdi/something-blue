@current
Feature: Lendings of a user
  In order to keep track of the items I have lent
  As a user
  I want to see them in a nice list
  
  Scenario: Logged in user sees his lendings
  Given there is a user called "seneca"
  And there is a user called "lucilius"
  And there is a user called "marcus"
  And there is a lending called "Letters from a stoic"
  And the lending called "Letters from a stoic" is lent by "seneca"
  And the lending called "Letters from a stoic" is lent to "lucilius"
  And the lending called "Letters from a stoic" is for "5" days
  And there is a lending called "Meditations"
  And the lending called "Meditations" is lent by "marcus"
  And the lending called "Meditations" is lent to "lucilius"
  And I am logged in as "seneca"
  When I go to my lendings page
  Then I should see "Letters from a stoic"
  And I should see "lucilius"
  And I should see "5"
  But I should not see "Meditations"