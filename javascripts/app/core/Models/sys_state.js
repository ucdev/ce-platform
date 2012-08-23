#! ce._core.models.Sys_state extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_state = Backbone.Model.extend
      url: ->
                base = "/api/sys_states/"
                if @isNew()
                    base
                else
                    base + @id

