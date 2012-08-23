#! ce._core.models.Twilio_log extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Twilio_log = Backbone.Model.extend
      url: ->
                base = "/api/twilio_logs/"
                if @isNew()
                    base
                else
                    base + @id

