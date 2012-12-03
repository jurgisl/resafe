Feature: Add password
  As a user
  I want to save a password securely
  So that I can access it later
  
  Background:
    Given I am authenticated as a "user"
    And I am on page "passwords"
  
  Scenario: Add password form
    When I click on a link "New Password"
    Then I should see password form
  
  Scenario: Add password
    Given I click on a link "New Password"
    When I enter password named "my password"
    And I press a button "Save"
    Then I should be on page "passwords"
    And I should see "my password"
    
    
  