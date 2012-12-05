Feature: Change user password
  As a user
  I want to change my login password
  To increase security of the system by allowing users choose their own passwords
  
  Background:
    Given there is a user "simpleuser" with password "password"
    And I am on page "login"
    And I enter username and password "simpleuser", "password"
    And press a button "Login"
    
  Scenario: Change password
    Given I click on a link "simpleuser"
    When I enter "password" in field "Current password"
    And I enter "password2" in field "Password"
    And I enter "password2" in field "Password confirmation"
    And I press a button "Update"
    Then I should see "You updated your account successfully."
  