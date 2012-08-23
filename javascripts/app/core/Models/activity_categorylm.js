#! ce._core.models.Activity_categorylm extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_categorylm = Backbone.Model.extend
      url: ->
                base = "/api/activity_categorylms/"
                if @isNew()
                    base
                else
                    base + @id

