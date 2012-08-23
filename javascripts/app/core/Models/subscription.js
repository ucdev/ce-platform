#! ce._core.models.Subscription extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Subscription = Backbone.Model.extend
      url: ->
                base = "/api/subscriptions/"
                if @isNew()
                    base
                else
                    base + @id

