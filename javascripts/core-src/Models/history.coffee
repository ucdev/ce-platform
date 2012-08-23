#! ce._core.models.History.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.History.coffee = Backbone.Model.extend
      url: ->
                base = "/api/history.coffee/"
                if @isNew()
                    base
                else
                    base + @id

