#! ce._core.models.Attendee_phone extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_phone = Backbone.Model.extend
      url: ->
                base = "/api/attendee_phones/"
                if @isNew()
                    base
                else
                    base + @id

