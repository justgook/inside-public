exports.config =
	# Edit the next line to change default build path.
	buildTarget: 'DEBUG'
	paths:
		public: 'public'
	files:
		javascripts:
			# Defines what file will be generated with `brunch generate`.
			defaultExtension: 'js'

			# Describes how files will be compiled & joined together.
			# Available formats:
			# * 'outputFilePath'
			# * map of ('outputFilePath': /regExp that matches input path/)
			# * map of ('outputFilePath': function that takes input path)
			joinTo:
				'javascripts/app.js': /^app/
				# 'javascripts/vendor.js': /^vendor/
				'javascripts/vendor.js': ///
				#add all scripts that located in /vendor/scripts directory (and ignore subdirs)
				^vendor[\/\\]scripts[\/\\][^\/^\\]+$
				#add backbone Plugins
				|^vendor[\/\\]scripts[\/\\]backbone[\/\\](
							# (?!styles[\/\\]login\.styl)
							backbone.subroute
							| backbone.stickit
							# | backbone-mediator
						)\.js
				# 'js/vendor.js':  # vendor lib jquery customBuild
				|^vendor[\/\\]scripts[\/\\]jquery[\/\\](
							# (?!styles[\/\\]login\.styl)
							  ajax
							| ajax/jsonp.js
							| ajax/script.js
							| ajax/xhr.js
							| attributes
							| callbacks
							| core
							| css
							| data
							| deferred
							| deprecated
							| dimensions
							| effects
							| event
							| event-alias
							| exports
							| intro
							| manipulation
							| offset
							| outro
							| queue
							| selector-native
							| serialize
							# | sizzle-jquery
							| support
							| traversing
							| wrap
							# { flag: "wrap", src: "src/wrap.js" },
							# { flag: "css", src: "src/css.js" },
							# { flag: "ajax", src: "src/ajax.js" },
							# { flag: "ajax/script", src: "src/ajax/script.js", needs: ["ajax"]  },
							# { flag: "ajax/jsonp", src: "src/ajax/jsonp.js", needs: [ "ajax", "ajax/script" ]  },
							# { flag: "ajax/xhr", src: "src/ajax/xhr.js", needs: ["ajax"]  },
							# { flag: "effects", src: "src/effects.js", needs: ["css"] },
							# { flag: "offset", src: "src/offset.js", needs: ["css"] },
							# { flag: "dimensions", src: "src/dimensions.js", needs: ["css"] },
							# { flag: "deprecated", src: "src/deprecated.js" },
						)\.js$
					///
			# Defines compilation order.
			# `vendor` files will be compiled before other ones
			# even if they are not present here.
			order:
				before: [
					#jQuery
					"vendor/scripts/jquery/intro.js",
					"vendor/scripts/jquery/core.js",
					# "src/selector-sizzle.js",
					"vendor/scripts/jquery/selector-native.js",
					"vendor/scripts/jquery/callbacks.js",
					"vendor/scripts/jquery/deferred.js",
					"vendor/scripts/jquery/support.js",
					"vendor/scripts/jquery/data.js",
					"vendor/scripts/jquery/queue.js",
					"vendor/scripts/jquery/attributes.js",
					"vendor/scripts/jquery/event.js",
					"vendor/scripts/jquery/traversing.js",
					"vendor/scripts/jquery/manipulation.js",
					"vendor/scripts/jquery/wrap.js",
					"vendor/scripts/jquery/css.js",
					"vendor/scripts/jquery/serialize.js",
					"vendor/scripts/jquery/event-alias.js",
					"vendor/scripts/jquery/ajax.js",
					"vendor/scripts/jquery/ajax/script.js",
					"vendor/scripts/jquery/ajax/jsonp.js",
					"vendor/scripts/jquery/ajax/xhr.js",
					"vendor/scripts/jquery/effects.js",
					"vendor/scripts/jquery/offset.js",
					"vendor/scripts/jquery/dimensions.js",
					"vendor/scripts/jquery/deprecated.js",
					"vendor/scripts/jquery/exports.js",
					"vendor/scripts/jquery/outro.js",
					#Others
					'vendor/scripts/console-helper.js',
					'vendor/scripts/underscore-1.4.4.js',
					'vendor/scripts/backbone-1.0.0.js',
					'vendor/scripts/backbone/backbone.subroute.js',
					'vendor/scripts/backbone/backbone.stickit.js',
					'vendor/scripts/backbone/backbone-mediator.js'
				]
		stylesheets:
			defaultExtension: 'styl'
			joinTo:
				'stylesheets/app.css': /^app(\/|\\)(?!styles[\/\\]login\.styl)/
				'stylesheets/vendor.css': /^vendor/
				'stylesheets/login.css': /^app(\/||\\)styles(\/||\\)login\.styl$/
		templates:
			defaultExtension: 'jade'
			joinTo: 'javascripts/templates.js'
	plugins:
		coffeelint:
			pattern: /^app\/.*\.coffee$/
			options:
				indentation:
					value: 2
					level: "error"
				max_line_length:
					value: 80
					level: "error"
				no_empty_param_list:
					value: yes
					level: "error"
				line_endings:
					value: "unix"
					level: "error"

		uglify:
			mangle: yes
			compress:
				global_defs:
					DEBUG: yes
		jade:
			# pretty: yes # Adds pretty-indentation whitespaces to output (false by default)
			compileDebug: no
			locals: {VERSION:"BUGAGAGA"}
			# debug: yes
		static_jade:                       # all optionals
			extension:  ".static.jade"              # static-compile each file with this extension in `assets`
			path:       [ /app/ ] # static-compile each file in this directories
			asset:      "public"             # specify the compilation output
	modules:
		addSourceUrls : no
	notifications: no