Feature: Administrate users
  As an administrator
  I add and delete users and assign them to groups
  To allow others access to the secrets
  
  Background:
    Given there is a group "Administrator"
    And there is a group "Simple User"
    And I am authenticated as a "Administrator"
  
  Scenario: Admin users menu
    Given I am on page "passwords"
    When I click on a link "Users"
    Then I should be on page "users administration"
  
  Scenario: Add user
    Given I am on page "users administration"
    When I click on a link "New User"
    Then I should see "new user" form
  
  Scenario: Create user
    Given I am on page "users administration"
    And I click on a link "New User"
    When I enter "superuser" in field "Username"
    When I enter "superuser@example.com" in field "Email"
    And I enter "password" in field "Password"
    And I enter "password" in field "Password confirmation"
    And I select "Simple User" from select "Groups"
    And I press a button "Save"
    Then I should see "superuser"
    And I should see "Simple User"
    
    