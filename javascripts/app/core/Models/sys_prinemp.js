#! ce._core.models.Sys_prinemp extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_prinemp = Backbone.Model.extend
      url: ->
                base = "/api/sys_prinemps/"
                if @isNew()
                    base
                else
                    base + @id

