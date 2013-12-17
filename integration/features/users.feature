Feature: Users
  there must be possibility to set users in database
  and fetch that from server via socket

  Background:
    Given server started
    And a global administrator named "Greg"
    # And a blog named "Greg's anti-tax rants"
    # And a customer named "Dr. Bill"
    # And a blog named "Expensive Therapy" owned by "Dr. Bill"

  Scenario:
    Given server user list:
      """
      | name  | password  |
      | user1 | password1 |
      | user2 | password2 |
      """
    When admin ask server for users
    Then server must response:
      """
        [
          {"name": "user1", "password": "password1"},
          {"name": "user2", "password": "password2"}
        ]
      """