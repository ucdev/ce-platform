#! ce._core.models.Action.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Action.coffee = Backbone.Model.extend
      url: ->
                base = "/api/action.coffee/"
                if @isNew()
                    base
                else
                    base + @id

