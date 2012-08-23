#! ce._core.models.Sys_orgtype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_orgtype = Backbone.Model.extend
      url: ->
                base = "/api/sys_orgtypes/"
                if @isNew()
                    base
                else
                    base + @id

