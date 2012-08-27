#! ce._core.models.Sys_activitytype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_activitytype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_activitytype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

