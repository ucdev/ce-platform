#! ce._core.models.Sys_role.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_role.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_role.coffee/"
                if @isNew()
                    base
                else
                    base + @id

