#! ce._core.models.Activity_categorylm.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_categorylm.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_categorylm.coffee/"
                if @isNew()
                    base
                else
                    base + @id

