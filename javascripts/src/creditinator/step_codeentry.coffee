ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,user) ->
	#CODE ENTRY STEP
	self.steps.CodeEntry = self.views.StepView.extend
		eventCode:$(".eventCode")
		
		checkCode: (eventCode) ->

		isStepValid: ->
			return false

		isCompleted: ->
			return false

		nextStep: ->
			if user.isLoggedIn()
				return 'confirmed'
			else
				return 'auth'
		

		events:
			".continueBtn click":"saveCode"
	return
,ce._core.models,ce.log,ce.user