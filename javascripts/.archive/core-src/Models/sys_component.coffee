#! ce._core.models.Sys_component.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_component.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_component.coffee/"
                if @isNew()
                    base
                else
                    base + @id

