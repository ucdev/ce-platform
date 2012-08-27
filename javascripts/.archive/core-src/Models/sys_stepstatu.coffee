#! ce._core.models.Sys_stepstatu.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_stepstatu.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_stepstatu.coffee/"
                if @isNew()
                    base
                else
                    base + @id

