ce.module "ui", (self, ce, Backbone, Marionette, $, _, models) ->
	self.SelectAllCheckBox = Backbone.View.extend
		template: "ui-selectallcheckbox"
		qtipSelectTemplate: "ui-selectallqtip"
		qtipDeselectTemplate: "ui-deselectallqtip"

		initialize: ->
			@collection.on "reset", @determineCheckedStatus, @
			self.on "selected_count_changed", @determineCheckedStatus, @
			return

		events:
			"change .js-check-all": "selectAllVisibleParticipants"

		render: ->
			# CLEAR THE CONTAINER
			@$el.empty()

			#BUILD THE TEMPLATE
			_temp = _.template ce.templates.get @template

			# ATTACH THE TEMPLATE TO THE HTML
			@$el.html _temp

			# CREATE A SELECT ALL QTIP
			@$el.qtip
				content: "PLACEHOLDER"
				position:
					my: "middle left"
					at: "middle right"
				show: ->
					return false
				hide: "unfocus"

			self.trigger "selectallcheckbox_rendered"
			return

		# SELECTS EVERY MODEL OF DATA WTIHIN THE COLLECTION
		deselectAllParticipants: ->
			# LOOP OVER ENTIRE COLLECTION
			_.forEach @collection.sortedAndFilteredModels, (model) ->
				# SET ISSELECTED AS FALSE
				model.set ISSELECTED: false

			self.trigger "selected_count_changed"
			self.trigger "selectallcheckbox_deselectall"
			return

		# ADJUSTS THE STATE OF THE CHECKBOX BASED ON VISIBLE MODEL CHECKBOX STATUS
		determineCheckedStatus: ->
			totalSelected = 0

			# LOOP OVER MODELS
			_.forEach @collection.models, (model) ->
				# DETERMINE MODEL'S CHECKED STATUS
				if model.get "ISSELECTED"
					# UPDATE TOTALSELECTED COUNT
					totalSelected++

			# DETERMINE IF ALL MODELS WERE MARKED SELECTED
			if totalSelected == @collection.perPage || totalSelected == @collection.models.length
				# MARK SELECTALL CHECKBOX AS CHECKED
				@$el.find(".js-check-all").attr "checked", true
			else
				# MARK SELECTALL CHECKBOX AS UNCHECKED
				@$el.find(".js-check-all").attr "checked", false
			return

		# SELECTS EVERY MODEL OF DATA WTIHIN THE COLLECTION
		selectAllParticipants: ->
			# LOOP OVER ENTIRE COLLECTION
			_.forEach @collection.sortedAndFilteredModels, (model) ->
				# SET ISSELECTED AS TRUE
				model.set ISSELECTED: true

			self.trigger "selected_count_changed"
			self.trigger "selectallcheckbox_selectall"
			return

		# SELECTS ONLY THE VISIBLE MODELS OF DATA
		selectAllVisibleParticipants: ->
			# CREATE A NESTED this VARIABLE
			curr = @

			# MAKE SURE QTIP IS CLOSED
			@$el.qtip "hide"

			# DETERMINE IF THE SELECTALL CHECKBOX IS CHECKED
			if @$el.find(".js-check-all").is ":checked"
				# LOOP OVER VISIBLE MODELS AND MARK AS SELECTED
				_.forEach @collection.models, (model) ->
					model.set ISSELECTED: true

				# UPDATE QTIP CONTENT
				@$el.qtip "option", "content.text", _.template ce.templates.get @qtipSelectTemplate

				# REVEAL THE QTIP
				@$el.qtip "show"

				# BIND CLICK EVENT FOR THE LINK IN THE QTIP
				$($.find("a.js-select-all-participants")).click ->
					# LOOP OVER EVERY MODEL IN COLLECTION AND MARK SELECTED
					curr.selectAllParticipants()

					# HIDE THE QTIP
					curr.$el.qtip "hide"


				self.trigger "selectallcheckbox_selectvisible"
			else
				# DETERMINE IF THE TOTAL SELECTED MATCHES THAT OF THE TOTAL CURRENTLY FILTERED
				if @collection.getSelectedCount() == @collection.getFilteredCount()
					# UPDATE QTIP CONTENT
					@$el.qtip "option", "content.text", _.template ce.templates.get @qtipDeselectTemplate

					# REVEAL THE QTIP
					@$el.qtip "show"

					# BIND CLICK EVENT FOR THE LINK IN THE QTIP
					$($.find("a.js-deselect-all-participants")).click ->
						# LOOP OVER EVERY MODEL IN COLLECTION AND MARK UNSELECTED
						curr.deselectAllParticipants()

						# HIDE THE QTIP
						curr.$el.qtip "hide"

				_.forEach @collection.models, (model) ->
					model.set ISSELECTED: false

				self.trigger "selectallcheckbox_deselectvisible"

			self.trigger "selected_count_changed"
			return