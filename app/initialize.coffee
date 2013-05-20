# Initialize Router
require 'router'
$ ->
  # Initialize Backbone History
  Backbone.history.start pushState: yes
  Object.freeze(this) if typeof Object.freeze == 'function'