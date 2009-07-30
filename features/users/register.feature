@users
Feature: Register
  In order to be able to record lendings
  As an interested person
  I want to have an account on the site
  
  Scenario: Providing valid user data
  When I go to the register page
  And I fill in the user's login with "balint"
  And I fill in the user's password with "bigSecRet"
  And I fill in the user's password confirmation with "bigSecRet"
  And I press "Create user"
  Then I should see "User has been created"
  And I should see "Login"