#! ce._core.models.Sys_categorylm extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_categorylm = Backbone.Model.extend
      url: ->
                base = "/api/sys_categorylms/"
                if @isNew()
                    base
                else
                    base + @id

