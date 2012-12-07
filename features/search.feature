Feature: Search passwords
  As a user
  I want to find passwords using any part of metadata about them
  So that I can find passwords fast
    
  Background:
    Given there is a group "User"
    And there is a category "My passwords"
    And category "My passwords" is accessible by "User" group
    And I am authenticated as a "User" 
    And I am on page "passwords"
    
  @javascript
  Scenario: Find password by category
    Given there are categories:
      | Name      | Parent  | Groups |
      | Parents   |         | User   |
      | Children  | Parents | User   |
    And there is password "Parent password" with category "Parents"
    And there is password "Child password" with category "Children"
    When I enter "Children" in field "Search"
    Then I should see "Child password"
    And I should not see "Parent password"
  
  @javascript
  Scenario: Find password by name
    Given there is password "Secret" with category "My passwords"
    And there is password "Important" with category "My passwords"
    When I enter "secret" in field "Search"
    Then I should see "Secret"
    And I should not see "Important"