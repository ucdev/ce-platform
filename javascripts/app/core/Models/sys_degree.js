#! ce._core.models.Sys_degree extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_degree = Backbone.Model.extend
      url: ->
                base = "/api/sys_degrees/"
                if @isNew()
                    base
                else
                    base + @id

