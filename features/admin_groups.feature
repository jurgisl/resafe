Feature: Administrate groups
  As an administrator
  I add and delete user groups
  To be able to group user access to categories
  
  Background:
    Given there is a group "Administrator"
    And I am authenticated as a "Administrator"
  
  Scenario: Admin groups menu
    Given I am on page "passwords"
    When I click on a link "Groups"
    Then I should be on page "groups administration"
  
  Scenario: Add group
    Given I am on page "groups administration"
    When I click on a link "New Group"
    Then I should see "new group" form
  
  Scenario: Create group
    Given I am on page "groups administration"
    And I click on a link "New Group"
    When I enter "Simple User" in field "Name"
    And I press a button "Save"
    Then I should see "Simple User"