#! ce._core.models.Sys_cbofund.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_cbofund.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_cbofund.coffee/"
                if @isNew()
                    base
                else
                    base + @id

