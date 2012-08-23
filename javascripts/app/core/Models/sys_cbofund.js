#! ce._core.models.Sys_cbofund extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_cbofund = Backbone.Model.extend
      url: ->
                base = "/api/sys_cbofunds/"
                if @isNew()
                    base
                else
                    base + @id

