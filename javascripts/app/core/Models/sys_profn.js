#! ce._core.models.Sys_profn extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_profn = Backbone.Model.extend
      url: ->
                base = "/api/sys_profns/"
                if @isNew()
                    base
                else
                    base + @id

