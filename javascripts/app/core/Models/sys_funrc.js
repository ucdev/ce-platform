#! ce._core.models.Sys_funrc extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_funrc = Backbone.Model.extend
      url: ->
                base = "/api/sys_funrcs/"
                if @isNew()
                    base
                else
                    base + @id

