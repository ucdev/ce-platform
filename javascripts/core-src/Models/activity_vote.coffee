#! ce._core.models.Activity_vote.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_vote.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_vote.coffee/"
                if @isNew()
                    base
                else
                    base + @id

