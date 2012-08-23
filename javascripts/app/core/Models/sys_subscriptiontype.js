#! ce._core.models.Sys_subscriptiontype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_subscriptiontype = Backbone.Model.extend
      url: ->
                base = "/api/sys_subscriptiontypes/"
                if @isNew()
                    base
                else
                    base + @id

