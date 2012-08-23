#! ce._core.models.Sys_activitysteptype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_activitysteptype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_activitysteptype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

