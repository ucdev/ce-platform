#! ce._core.models.Sys_activitytype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_activitytype = Backbone.Model.extend
      url: ->
                base = "/api/sys_activitytypes/"
                if @isNew()
                    base
                else
                    base + @id

