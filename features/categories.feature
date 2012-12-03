Feature: Categories
  As a user
  I want passwords to be arranged in categories
  So that I can find them easly
  
  Background:
    Given there are categories:
      | Name            | Parent          |
      | Parent category |                 |
      | Child category  | Parent category |
  
  Scenario: Category list
    Given there is password "My password" with category "Parent category"
    And I am on page "passwords"
    Then I should see "Parent category"
    And I should see "My password"
    
  Scenario: Subcategory
    Given there is password "My password" with category "Child category"
    And I am on page "passwords"
    When I click on a link "Parent category"
    Then I should not see "My password"
    
  Scenario: Subcategory list
    Given there is password "My password" with category "Child category"
    And I am on page "passwords"
    When I click on a link "Parent category"
    And I click on a link "Child category"
    Then I should see "My password"
    