Feature: Add category
  As a user
  I want to add a category
  So that I can organize my passwords, to find them faster and increase usability of the system
  
  Background:
    Given there is a group "User"
    And I am authenticated as a "User"  
    And I am on page "passwords"
    
  Scenario: Add Category form
    When I click on a link "New Category"
    Then I should see "new category" form
    
  Scenario: Add Category 
    Given I click on a link "New Category"
    And I enter "my category" in field "Name"
    And I press a button "Save"
    Then I should be on page "passwords"
    And I should see "my category"
    
  
  
  