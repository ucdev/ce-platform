#! ce._core.models.Attendee.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendee.coffee/"
                if @isNew()
                    base
                else
                    base + @id

