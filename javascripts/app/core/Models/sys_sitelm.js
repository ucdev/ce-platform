#! ce._core.models.Sys_sitelm extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_sitelm = Backbone.Model.extend
      url: ->
                base = "/api/sys_sitelms/"
                if @isNew()
                    base
                else
                    base + @id

