#! ce._core.models.Sys_orgtype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_orgtype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_orgtype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

