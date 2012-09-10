ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.Loader = Backbone.View.extend
		template: "ui-loader"

		className: "loader"

		defaults:
			lines: 8, # The number of lines to draw
			length: 3, # The length of each line
			width: 4, # The line thickness
			radius: 10, # The radius of the inner circle
			corners: .3, # Corner roundness (0..1)
			rotate: 0, # The rotation offset
			color: '#000', # #rgb or #rrggbb
			speed: 1, # Rounds per second
			trail: 60, # Afterglow percentage
			shadow: false, # Whether to render a shadow
			hwaccel: false, # Whether to use hardware acceleration
			className: 'loader', # The CSS class to assign to the spinner
			zIndex: 2e9, # The z-index (defaults to 2000000000)
			top: '30px', # Top position relative to parent in px
			left: '50%' # Left position relative to parent in px

		initialize: ->
			self.on "loader_start", @start, @
			self.on "loader_stop", @stop, @
			return

		render: ->
			#_temp = _.template ce.templates.get @template
			@spinner = new Spinner(@defaults).spin()

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.prepend @spinner.el

			self.trigger "loader_loaded"
			return

		start: ->
			@render()

			self.trigger "loader_started"
			return

		stop: ->
			# REMOVE THE SPINNER
			@spinner.stop()

			# REMOVE THE LOADER ELEMENT
			$("." + @className).remove()

			self.trigger "loader_stopped"
			return
	return