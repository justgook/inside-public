pjson = require('./package.json');
exports.config =
    # See http://brunch.io/#documentation for docs.
    paths:
        public: 'public'
    conventions:
        # assets: /(^bower_components(\/|\\)font-awesome(\/|\\)font)|assets(\/|\\)/
        assets: (path) ->
            # console.log path
            return true if /assets(\/|\\)/.test path
            return false if /^bower_components(\/|\\)font-awesome(\/|\\)css/.test path
            return true if /^bower_components(\/|\\)font-awesome(\/|\\)/.test path
    files:
        javascripts:
            joinTo:
              "app.js": /^app/
              "vendor.js": /^bower_components/
        stylesheets:
            defaultExtension: 'styl'
            joinTo:
              "app.css": /^app/
              "vendor.css": /^bower_components/
        templates:
            defaultExtension: 'jade'
            joinTo: 'templates.js'
    plugins:
        uglify:
            mangle: yes
            compress:
                global_defs:
                    DEBUG: yes
        jade:
            # pretty: yes # Adds pretty-indentation whitespaces to output (false by default)
            compileDebug: no
            locals:
                VERSION: pjson.version
                NAME: pjson.name
                AUTHOR: pjson.author
                HOMEPAGE: pjson.homepage
                LICENSE: pjson.license
            # debug: yes
        static_jade:                       # all optionals
            extension:  ".static.jade"              # static-compile each file with this extension in `assets`
            path:       [ /app/ ] # static-compile each file in this directories
            asset:      "public"
    server:
        path: 'server.coffee'
        port: 3333
        base: '/'
