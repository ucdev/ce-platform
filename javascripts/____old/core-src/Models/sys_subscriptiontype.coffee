#! ce._core.models.Sys_subscriptiontype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_subscriptiontype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_subscriptiontype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

