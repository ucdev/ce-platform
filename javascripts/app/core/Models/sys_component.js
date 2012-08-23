#! ce._core.models.Sys_component extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_component = Backbone.Model.extend
      url: ->
                base = "/api/sys_components/"
                if @isNew()
                    base
                else
                    base + @id

