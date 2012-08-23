#! ce._core.models.Attendee_component.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_component.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendee_component.coffee/"
                if @isNew()
                    base
                else
                    base + @id

