Feature: Settings
  for some modules is required possibility
  to set settings assign to user and module,
  but also there is some default settings per module

  Scenario: Create default module settings
    When I push settings to server
    Then I should see "Settings Added" message

  # Scenario: Authorization with correct user
  #   Given I am not logged in
  #   And I am connected to websocket
  #   And there is a registered user "bob" with the password "password"
  #   When I post correct username and password
  #   Then I should see "Authorization accepted" message

  # Scenario: Authorization with incorrect user
  #   Given I am connected to websocket
  #   When I post incorrect username and password
  #   Then I should see "Authorization declined" message

  # Scenario: Reconnect
  #   Given I am connected to websocket
  #   When I reconnect to websocket
  #   Then I should see "Unauthorized" error