ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log) ->
	self.views = self.views || {}
	self.steps = self.steps || {}
	
	#MAIN STEP VIEW (extend this to get proper structure and bindings)
	self.views.StepView = Backbone.View.extend
	    #ELEMENTS
	    el:$(".creditinator-view")
	    continueBtn:$(".continueBtn")
	    backBtn:$(".backBtn")
	    
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
	    	".continueBtn click":"moveOn"
	    	".backBtn click":"moveBack"

	    initialize: ->
	      _.bindAll @
	      @render()

	    beforeGoToNext: ->
	    	
	    	return true

	    goToNext: ->
	    	return

	    goToPrev: ->
	    	return

	    render: ->
	      $(@el).append ''
	return