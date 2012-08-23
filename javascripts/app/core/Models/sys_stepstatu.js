#! ce._core.models.Sys_stepstatu extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_stepstatu = Backbone.Model.extend
      url: ->
                base = "/api/sys_stepstatuses/"
                if @isNew()
                    base
                else
                    base + @id

