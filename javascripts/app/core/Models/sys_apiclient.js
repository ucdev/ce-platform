#! ce._core.models.Sys_apiclient extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_apiclient = Backbone.Model.extend
      url: ->
                base = "/api/sys_apiclients/"
                if @isNew()
                    base
                else
                    base + @id

