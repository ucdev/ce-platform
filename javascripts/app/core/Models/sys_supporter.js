#! ce._core.models.Sys_supporter extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_supporter = Backbone.Model.extend
      url: ->
                base = "/api/sys_supporters/"
                if @isNew()
                    base
                else
                    base + @id

