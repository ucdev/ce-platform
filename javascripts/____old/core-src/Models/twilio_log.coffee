#! ce._core.models.Twilio_log.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Twilio_log.coffee = Backbone.Model.extend
      url: ->
                base = "/api/twilio_log.coffee/"
                if @isNew()
                    base
                else
                    base + @id

