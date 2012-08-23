#! ce._core.models.Sys_role extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_role = Backbone.Model.extend
      url: ->
                base = "/api/sys_roles/"
                if @isNew()
                    base
                else
                    base + @id

