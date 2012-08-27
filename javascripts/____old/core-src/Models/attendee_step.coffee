#! ce._core.models.Attendee_step.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_step.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendee_step.coffee/"
                if @isNew()
                    base
                else
                    base + @id

