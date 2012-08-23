#! ce._core.models.Sys_sitelm.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_sitelm.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_sitelm.coffee/"
                if @isNew()
                    base
                else
                    base + @id

