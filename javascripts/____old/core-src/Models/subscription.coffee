#! ce._core.models.Subscription.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Subscription.coffee = Backbone.Model.extend
      url: ->
                base = "/api/subscription.coffee/"
                if @isNew()
                    base
                else
                    base + @id

