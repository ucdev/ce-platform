#! ce._core.models.Sys_apiclient.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_apiclient.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_apiclient.coffee/"
                if @isNew()
                    base
                else
                    base + @id

