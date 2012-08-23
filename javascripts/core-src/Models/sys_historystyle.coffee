#! ce._core.models.Sys_historystyle.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_historystyle.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_historystyle.coffee/"
                if @isNew()
                    base
                else
                    base + @id

