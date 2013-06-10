#optimized.coffee contents:
default = require('./config').config
exports.config = default
exports.config.paths.public = 'deploy'
exports.config.templates.joinTo = 'javascripts/app.js'