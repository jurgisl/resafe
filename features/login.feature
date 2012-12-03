Feature: Authenticate user
  As a user
  I want to be authenticated in system
  So I can access my saved passwords
  
  Scenario: User login
    Given there is a user "user" with password "password"
    And I am on page "login"
    When I enter username and password "user", "password"
    And press a button "Login"
    Then I should be on page "home"
    And I should see "Signed in successfully"
    
  Scenario: User logout
    Given I am authenticated as a "user"
    And I am on page "home"
    When I click on a link "Logout"
    Then I should be on page "login"