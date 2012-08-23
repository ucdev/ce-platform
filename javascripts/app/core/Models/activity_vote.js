#! ce._core.models.Activity_vote extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_vote = Backbone.Model.extend
      url: ->
                base = "/api/activity_votes/"
                if @isNew()
                    base
                else
                    base + @id

