Feature: Categories
  As a user
  I want passwords to be arranged in categories
  So that I can find them easly
  
  Background:
    Given there are categories:
      | Name            | Parent          |
      | Parent category |                 |
      | Child category  | Parent category |      
    And I am authenticated as a "user"
  
  Scenario: Category list
    Given there is password "My password" with category "Parent category"
    And I am on page "passwords"
    When I click on a link "Parent category"
    Then I should see "My password"
    
  Scenario: Subcategory
    Given there is password "My password" with category "Child category"
    And I am on page "passwords"
    When I click on a link "Parent category"
    Then I should not see "My password"
    And I should see link "Child category"
    
  Scenario: Subcategory list
    Given there is password "My password" with category "Child category"
    And I am on page "passwords"
    When I click on a link "Parent category"
    And I click on a link "Child category"
    Then I should see "My password"
    