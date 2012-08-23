#! ce._core.models.Sys_funrn extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_funrn = Backbone.Model.extend
      url: ->
                base = "/api/sys_funrns/"
                if @isNew()
                    base
                else
                    base + @id

