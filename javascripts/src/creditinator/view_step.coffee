ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,wheels) ->
	self.views = self.views || {}
	self.views.steps = self.steps || {}
	
	#MAIN STEP VIEW (extend this to get proper structure and bindings)
	self.views.StepView = Backbone.View.extend
		#ELEMENTS
		el:".creditinator-view"
		continueEl:".continueBtn"
		backEl:".backBtn"

		wheelsAction:"start"
		wheelsControllerPath:"/creditinator/"
		
		wheelsFullPath: ->
			return @wheelsControllerPath + "" + @wheelsAction

		#STEP STATE
		isStepValid: ->
			return false
		currentStep:"unknown"
		nextStep:"unknown"
		prevStep:"unknown"

		#OTHER INFO
		stepTitle:"Untitled Step"
		stepSubTitle:""

		events:
			"click .continueBtn":"goToNext"
			"click .backBtn":"goToPrev"

		initialize: ->
			_.bindAll @
			@render()
			@$continueEl = $(@el).find(@continueEl);
			@$backEl = $(@el).find(@backEl);
		beforeGoToNext: ->
			return
		goToNext: (ev) ->
			if @beforeGoToNext()
				wheels.go
					url: @wheelsFullPath()

			ev.preventDefault()
			return false
		goToPrev: ->
			return
		render: ->
			$(@el).html()
	return
,ce._core.models,ce.log,ce.wheels