#! ce._core.models.Sys_statu extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_statu = Backbone.Model.extend
      url: ->
                base = "/api/sys_statuses/"
                if @isNew()
                    base
                else
                    base + @id

