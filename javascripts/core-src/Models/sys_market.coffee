#! ce._core.models.Sys_market.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_market.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_market.coffee/"
                if @isNew()
                    base
                else
                    base + @id

