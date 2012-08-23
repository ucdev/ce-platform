#! ce._core.models.Sys_categorylm.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_categorylm.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_categorylm.coffee/"
                if @isNew()
                    base
                else
                    base + @id

