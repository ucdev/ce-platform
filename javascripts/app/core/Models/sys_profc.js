#! ce._core.models.Sys_profc extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_profc = Backbone.Model.extend
      url: ->
                base = "/api/sys_profcs/"
                if @isNew()
                    base
                else
                    base + @id

