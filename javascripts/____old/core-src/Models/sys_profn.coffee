#! ce._core.models.Sys_profn.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_profn.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_profn.coffee/"
                if @isNew()
                    base
                else
                    base + @id

