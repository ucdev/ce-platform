#! ce._core.models.Sys_state.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_state.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_state.coffee/"
                if @isNew()
                    base
                else
                    base + @id

