#! ce._core.models.Sys_historytype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_historytype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_historytype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

