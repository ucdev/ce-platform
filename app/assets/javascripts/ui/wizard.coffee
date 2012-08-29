ce.module "ui", (self, ce, Backbone, Marionette, $, _, models,log,wheels) ->
    self.Wizard = Backbone.View.extend
        id: "wizard"
        el: $(".ui_wizard")
        events:
            "click #next_step_button": "nextStep"
            "click #prev_step_button": "prevStep"

        initialize: ->
            _.bindAll this, "render"
            @currentStep = 0

        render: ->
            t = ce.template("ui_wizard")
            $(@el).html t({})
            @progressIndicator = @$("#progress_indicator")
            @title = @$("h2#step_title")
            @instructions = @$("p#step_instructions")
            @currentStepContainer = @$(".current_step_container")
            @nextStepButton = @$("#next_step_button")
            @prevStepButton = @$("#prev_step_button")
            @renderCurrentStep()
            this

        renderProgressIndicator: ->
            @progressIndicator.empty()
            _.each @options.steps, _.bind((step) ->
                text = "(" + step.step_number + ") " + step.title + ">>> "
                el = @make("span", {}, text)
                $(el).addClass "active"  if step.step_number is @currentStep + 1
                @progressIndicator.append el
            , this)

        renderCurrentStep: ->
            currentStep = @options.steps[@currentStep]
            prevStep = @options.steps[@currentStep - 1]  unless @isFirstStep()
            nextStep = @options.steps[@currentStep + 1]
            @title.html currentStep.title
            @instructions.html currentStep.instructions
            @currentView = currentStep.view
            @currentStepContainer.html @currentView.render().el
            @renderProgressIndicator()
            
            if prevStep
                @prevStepButton.html("Prev: " + prevStep.title).show()
            else
                @prevStepButton.hide()
            if nextStep
                @nextStepButton.html "Next: " + nextStep.title
            else
                @nextStepButton.html "Finish"

        nextStep: ->
            if @currentView.validate()
                unless @isLastStep()
                    @currentView.validate()
                    @currentStep += 1
                    @renderCurrentStep()
            else
                @save()

        prevStep: ->
            unless @isFirstStep()
                @currentStep -= 1
                @renderCurrentStep()

        isFirstStep: ->
            @currentStep is 0

        isLastStep: ->
            @currentStep is @options.steps.length - 1
    return
