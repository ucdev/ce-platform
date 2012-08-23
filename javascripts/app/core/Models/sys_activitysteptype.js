#! ce._core.models.Sys_activitysteptype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_activitysteptype = Backbone.Model.extend
      url: ->
                base = "/api/sys_activitysteptypes/"
                if @isNew()
                    base
                else
                    base + @id

