ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,user) ->
	#CODE ENTRY STEP
	self.views.steps.Identify = self.views.StepView.extend
		#ELEMENTS
	    wheelsAction:"identify"
	    wheelsControllerPath:"/creditinator/"
	    wheelsFullPath: ->
	    	return @wheelsControllerPath + "" + @wheelsAction
	    
	    #STEP STATE
	    isStepValid: ->
	    	return false

	    currentStep:"identify"
	    nextStep:"confirm"
	    prevStep:"start"

	    #OTHER INFO
	    stepTitle:"Okay, now let's identify you."
	    stepSubTitle:"It's quick and painless!"

	    beforeGoToNext: ->
	    	
	    	return true
	return
,ce._core.models,ce.log,ce.user