ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,user) ->
	#CODE ENTRY STEP
	self.views.steps.Start = self.views.StepView.extend
		#ELEMENTS
	    wheelsAction:"start"
	    nextStep: ->
	    	if user.isLoggedIn()
	    		return "finish"
	    	else
	    		return "identify"

	    prevStep:""
	    
	    #OTHER INFO
	    stepTitle:"Welcome!"
	    stepSubTitle:"Enter the code you were provided at the live event."

	    beforeGoToNext: ->
	    	$.ajax 
	    		url:'/creditinator/checkcode'
	    	return true
	return
,ce._core.models,ce.log,ce.user