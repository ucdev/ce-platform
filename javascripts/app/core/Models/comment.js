#! ce._core.models.Comment extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Comment = Backbone.Model.extend
      url: ->
                base = "/api/comments/"
                if @isNew()
                    base
                else
                    base + @id

