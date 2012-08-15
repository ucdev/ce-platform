ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.Loader = Backbone.View.extend
		template: _.template ce.templates.get "ui-loader"

		className: "loader"

		initialize: ->
			self.on "loader_start", @start, @
			self.on "loader_stop", @stop, @
			return

		render: ->
			# DETERMINE IF A PARENT ELEMENT IS PROVIDED
			#parentEl IS THE CONTENT CONTAINER FOR THE PAGE
			if typeof @options.parentEl != "undefined"
				# HIDE THE parentEl
				@options.parentEl.hide()

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.prepend @template

			self.trigger "loader_loaded"
			return

		start: ->
			@render()

			self.trigger "loader_started"
			return

		stop: ->
			# DETERMINE IF A PARENT ELEMENT IS PROVIDED
			#parentEl IS THE CONTENT CONTAINER FOR THE PAGE
			if typeof @options.parentEl != "undefined"
				# SHOW THE parentEl
				@options.parentEl.show()

			# REMOVE THE LOADER ELEMENT
			$("." + @className).remove()

			self.trigger "loader_stopped"
			return
	return