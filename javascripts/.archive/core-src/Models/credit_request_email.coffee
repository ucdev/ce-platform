#! ce._core.models.Credit_request_email.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Credit_request_email.coffee = Backbone.Model.extend
      url: ->
                base = "/api/credit_request_email.coffee/"
                if @isNew()
                    base
                else
                    base + @id

