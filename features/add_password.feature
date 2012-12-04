Feature: Add password
  As a user
  I want to save a password securely
  So that I can access it later
  
  Background:
    Given I am authenticated as a "user"      
    And there is a category "My passwords"
  
  Scenario: Add password form
    Given I am on passwords category "My passwords"
    When I click on a link "New Password"
    Then I should see password form
  
  Scenario: Add password
    Given I am on passwords category "My passwords"
    And I click on a link "New Password"
    When I enter password named "my password"
    And I press a button "Save"
    Then I should be on page "passwords"
    And I should see "my password"
  
  Scenario: Add password to category
    Given there is a category "Main category"
    And I am on page "passwords"
    And I click on a link "Main category"
    And I click on a link "New Password"
    When I enter password named "my password"
    And I press a button "Save"
    Then I should be on page "passwords"
    And I should see "Main category"
    And I should see "my password"
    
    
  