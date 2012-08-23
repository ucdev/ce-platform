#! ce._core.models.Sys_cbafund extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_cbafund = Backbone.Model.extend
      url: ->
                base = "/api/sys_cbafunds/"
                if @isNew()
                    base
                else
                    base + @id

