#! ce._core.models.Sys_cbafund.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_cbafund.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_cbafund.coffee/"
                if @isNew()
                    base
                else
                    base + @id

