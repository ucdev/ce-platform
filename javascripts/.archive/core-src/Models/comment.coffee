#! ce._core.models.Comment.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Comment.coffee = Backbone.Model.extend
      url: ->
                base = "/api/comment.coffee/"
                if @isNew()
                    base
                else
                    base + @id

