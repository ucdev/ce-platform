#! ce._core.models.Sys_historystyle extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_historystyle = Backbone.Model.extend
      url: ->
                base = "/api/sys_historystyles/"
                if @isNew()
                    base
                else
                    base + @id

