#! ce._core.models.Attendee_phone.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_phone.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendee_phone.coffee/"
                if @isNew()
                    base
                else
                    base + @id

