Feature: Authorization
  when user come to page he/she
  must authorize by login and password
  before get any information from server
  Background:
    Given server started
    And there is few user already registered:
      """
        | name  | password  |
        | user1 | password1 |
        | user2 | password2 |
      """

  # Scenario: Unauthorized
  #   When I connect to server
  #   Then I should see "Unauthorized" error

  Scenario: Authorization with correct user
    Given I am not logged in
    And I am connected to server
    When I post correct username "user1" and password "pasword1"
    Then I should receive:
    """
      {
        "message": "welcome"
      }
    """
  Scenario: Authorization with incorrect user
    When I post incorrect username "unregistred-user" and password "somepassword"
    Then I should receive:
    """
      "message": "error",
      "data":
           {
             "status": "400",
             "title": "Wrong username or password",
             "content": "All system stop!",
           }
    """