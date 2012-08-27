ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _) ->
	self.Adder = Backbone.View.extend
		template: "activity_participants-addbtn"

		initialize: ->
			return

		events:
			"click .js-add-btn": "add"

		render: ->
			@$el.empty()
			
			_temp = _.template ce.templates.get @template

			# FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
			@$el.append _temp

			self.trigger "adder_loaded"
			return @el

		add: ->
			@collection.add @options.defaults