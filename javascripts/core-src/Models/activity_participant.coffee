#! ce._core.models.Activity_participant.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_participant.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_participant.coffee/"
                if @isNew()
                    base
                else
                    base + @id

