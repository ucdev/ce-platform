#! ce._core.models.Sys_credit.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_credit.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_credit.coffee/"
                if @isNew()
                    base
                else
                    base + @id

