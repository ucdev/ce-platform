#! ce._core.models.Sys_funrn.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_funrn.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_funrn.coffee/"
                if @isNew()
                    base
                else
                    base + @id

