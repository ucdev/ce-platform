#! ce._core.models.Sys_profc.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_profc.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_profc.coffee/"
                if @isNew()
                    base
                else
                    base + @id

