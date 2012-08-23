#! ce._core.models.Sys_personstatu extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_personstatu = Backbone.Model.extend
      url: ->
                base = "/api/sys_personstatuses/"
                if @isNew()
                    base
                else
                    base + @id

