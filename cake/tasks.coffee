Help = require './tasks/help'
Module =
  Bootstrap: require './tasks/modules/bootstrap'
  Stickit:   require './tasks/modules/stickit'
module.exports =

  add:
    bootstrap:
      command:      'add:bootstrap'
      description:  'Add Bootstrap with Font Awesome'
      task:         -> do Module.Bootstrap.add
    stickit:
      command:      'add:stickit'
      description:  'Add backbone.stickit\n'
      task:         -> do Module.Stickit.add

  rem:
    bootstrap:
      command:      'rem:bootstrap'
      description:  'Remove Bootstrap with Font Awesome'
      task:         -> do Module.Bootstrap.remove
    stickit:
      command:      'rem:stickit'
      description:  'Remove backbone.stickit\n'
      task:         -> do Module.Stickit.remove

  help:
    npm:
      command:      'help:npm'
      description:  'Help for those running commands from npm\n'
      task:         -> do Help.npm