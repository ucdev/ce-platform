#! ce._core.models.Attendee_component extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_component = Backbone.Model.extend
      url: ->
                base = "/api/attendee_components/"
                if @isNew()
                    base
                else
                    base + @id

