#! ce._core.models.Credit_request_email extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Credit_request_email = Backbone.Model.extend
      url: ->
                base = "/api/credit_request_emails/"
                if @isNew()
                    base
                else
                    base + @id

