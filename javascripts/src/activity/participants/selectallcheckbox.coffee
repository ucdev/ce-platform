ce.module "activity.participants", (self, ce, Backbone, Marionette, $, _, models) ->
	self.SelectAllCheckBox = Backbone.View.extend
		template: "activity_participants-selectallcheckbox"

		events:
			"change .js-check-all": "selectAllParticipants"

		render: ->
			@$el.empty()

			_temp = _.template ce.templates.get @template

			@$el.html _temp

			self.trigger "selectallcheckbox_rendered"

		selectAllParticipants: ->
			_.forEach @collection.models, (model) ->
				model.set ISSELECTED: true


			self.trigger "selected_count_changed"