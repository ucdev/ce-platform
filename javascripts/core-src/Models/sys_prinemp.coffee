#! ce._core.models.Sys_prinemp.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_prinemp.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_prinemp.coffee/"
                if @isNew()
                    base
                else
                    base + @id

