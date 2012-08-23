#! ce._core.models.Attendee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee = Backbone.Model.extend
      url: ->
                base = "/api/attendees/"
                if @isNew()
                    base
                else
                    base + @id

