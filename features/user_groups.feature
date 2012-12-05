Feature: Access rights to user groups
  As an administrator
  I want to restrict access to certain passwords to certain user groups
  So that I can restrict important password leak to unpriviledged users
  
  Background:
    Given there is a group "User"
    And there is a group "Admin"
    And there is a category "Secure"
    And category "Secure" is accessible by "Admin" group
    And there is password "Gmail" with category "Secure"
  
  Scenario: Restrict access to category
    Given I am authenticated as a "User"
    When I am on page "passwords"
    Then I should not see link "Secure"
    Then I should not see "Gmail"
    
  @allow-rescue
  Scenario: Restrict direct access to category
    Given I am authenticated as a "User"
    When I am on a passwords category "Secure"
    Then I should see "Access denied"
    Then I should not see "Gmail"
    