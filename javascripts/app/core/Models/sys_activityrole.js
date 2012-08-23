#! ce._core.models.Sys_activityrole extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_activityrole = Backbone.Model.extend
      url: ->
                base = "/api/sys_activityroles/"
                if @isNew()
                    base
                else
                    base + @id

