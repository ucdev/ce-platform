#! ce._core.models.Attendeecdc extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendeecdc = Backbone.Model.extend
      url: ->
                base = "/api/attendeecdcs/"
                if @isNew()
                    base
                else
                    base + @id

