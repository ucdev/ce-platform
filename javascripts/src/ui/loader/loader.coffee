ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
	self.Loader = Backbone.View.extend
		template: "ui-loader"

		className: "loader"

		initialize: ->
			self.on "loader_start", @start, @
			self.on "loader_stop", @stop, @
			return

		render: ->
			_temp = _.template ce.templates.get @template

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.prepend _temp

			self.trigger "loader_loaded"
			return

		start: ->
			@render()

			self.trigger "loader_started"
			return

		stop: ->
			# REMOVE THE LOADER ELEMENT
			$("." + @className).remove()

			self.trigger "loader_stopped"
			return
	return