Feature: Show password
  As a user
  I want to see passwords only when I click on them
  So that any passerby cannot see other passwords while I'm browsing categories
  
  Scenario: Show password
    Given there is password "My password" with secret "MySecret"
    And I am authenticated as a "user"
    And I am on page "passwords"
    When I click on a link "Show"
    Then I should see "MySecret"
    