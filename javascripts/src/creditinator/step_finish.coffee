ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,user) ->
	#CODE ENTRY STEP
	self.views.steps.Finish = self.views.StepView.extend
		eventCode:$(".eventCode")
		
		
		checkCode: (eventCode) ->

		isStepValid: ->
			return false

		isCompleted: ->
			return false

		nextStep: ->
			if user.isLoggedIn()
				return 'finish'
			else
				return 'identify'
		

		events:
			".continueBtn click":"saveCode"
	
,ce._core.models,ce.log,ce.user