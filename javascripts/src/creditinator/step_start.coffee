ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,user) ->
	#CODE ENTRY STEP
	self.views.steps.Start = self.views.StepView.extend
		#ELEMENTS
	    wheelsAction:"start"
	    wheelsControllerPath:"/creditinator/"
	    wheelsFullPath: ->
	    	return @wheelsControllerPath + "" + @wheelsAction
	    
	    #STEP STATE
	    isStepValid: ->
	    	return false

	    currentStep:"start"
	    nextStep:"identify"
	    prevStep:""
	    
	    #OTHER INFO
	    stepTitle:"Welcome!"
	    stepSubTitle:"Enter the code you were provided at the live event."

	    beforeGoToNext: ->
	    	
	    	return true
	return
,ce._core.models,ce.log,ce.user