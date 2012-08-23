#! ce._core.models.Attendee_step extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_step = Backbone.Model.extend
      url: ->
                base = "/api/attendee_steps/"
                if @isNew()
                    base
                else
                    base + @id

