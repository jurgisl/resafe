Feature: Show password
  As a user
  I want to see passwords only when I click on them
  So that any passerby cannot see other passwords while I'm browsing categories
  
  Background:
    Given there is a group "User"      
    And there is a category "My passwords"
    And category "My passwords" is accessible by "User" group
  
  Scenario: Show password
    Given there is password "My password" with secret "MySecret" and category "My passwords"
    And I am authenticated as a "User"
    And I am on a passwords category "My passwords"
    When I click on a link "Show"
    Then I should see "MySecret"
    