Feature: Edit category
  As a user
  I want to edit a category
  So that I can reorganize my passwords, to find them faster and increase usability of the system
  
  Background:
    Given there is a group "User"
    And I am authenticated as a "User"  
    And there is a category "Secure"
    And category "Secure" is accessible by "User" group
    
  Scenario: Edit category form
    Given I am on a passwords category "Secure"
    When I click on a link "Edit category"
    Then I should see "edit category" form
    