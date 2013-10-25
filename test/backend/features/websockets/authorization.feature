Feature: Authorization
  when user come to page he/she
  must authorize by login and password
  before get any information from server

  Scenario: Unauthorized
    When I connect to websocket
    Then I should see "Unauthorized" error

  Scenario: Authorization with correct user
    Given I am not logged in
    And I am connected to websocket
    And there is a registered user "bob" with the password "password"
    When I post correct username and password
    Then I should see "Authorization accepted" message

  Scenario: Authorization with incorrect user
    Given I am connected to websocket
    When I post incorrect username and password
    Then I should see "Authorization declined" message

  Scenario: Reconnect
    Given I am connected to websocket
    When I reconnect to websocket
    Then I should see "Unauthorized" error