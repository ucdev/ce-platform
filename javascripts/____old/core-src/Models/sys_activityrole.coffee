#! ce._core.models.Sys_activityrole.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_activityrole.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_activityrole.coffee/"
                if @isNew()
                    base
                else
                    base + @id

