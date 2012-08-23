#! ce._core.models.Sys_historytype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_historytype = Backbone.Model.extend
      url: ->
                base = "/api/sys_historytypes/"
                if @isNew()
                    base
                else
                    base + @id

