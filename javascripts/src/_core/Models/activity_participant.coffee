#! ce._core.models.Activity_participant extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_participant = Backbone.Model.extend
      url: ->
                base = "/api/activity_participants/"
                if @isNew()
                    base
                else
                    base + @id

