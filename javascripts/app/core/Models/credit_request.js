#! ce._core.models.Credit_request extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Credit_request = Backbone.Model.extend
      url: ->
                base = "/api/credit_requests/"
                if @isNew()
                    base
                else
                    base + @id

