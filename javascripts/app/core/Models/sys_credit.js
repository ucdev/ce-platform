#! ce._core.models.Sys_credit extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_credit = Backbone.Model.extend
      url: ->
                base = "/api/sys_credits/"
                if @isNew()
                    base
                else
                    base + @id

