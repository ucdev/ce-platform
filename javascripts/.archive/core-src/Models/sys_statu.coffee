#! ce._core.models.Sys_statu.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_statu.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_statu.coffee/"
                if @isNew()
                    base
                else
                    base + @id

