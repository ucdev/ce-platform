#! ce._core.models.Sys_personstatu.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_personstatu.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_personstatu.coffee/"
                if @isNew()
                    base
                else
                    base + @id

