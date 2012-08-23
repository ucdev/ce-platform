#! ce._core.models.Sys_market extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_market = Backbone.Model.extend
      url: ->
                base = "/api/sys_markets/"
                if @isNew()
                    base
                else
                    base + @id

