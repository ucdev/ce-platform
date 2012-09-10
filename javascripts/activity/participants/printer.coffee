ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Printer = Backbone.View.extend
		template: "activity_participants-printer"

		initialize: ->
			return

		events:
			"click .js-print-btn": "print"

		render: ->
			_temp = _.template ce.templates.get @template

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.append _temp

			self.trigger "printer_loaded"
			return @el

		print: ->
			self.trigger "printer_printed"
			return