#! ce._core.models.Attendee_address.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_address.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendee_address.coffee/"
                if @isNew()
                    base
                else
                    base + @id

