#! ce._core.models.Activity_comment.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_comment.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_comment.coffee/"
                if @isNew()
                    base
                else
                    base + @id

