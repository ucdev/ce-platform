#! ce._core.models.Credit_cert.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Credit_cert.coffee = Backbone.Model.extend
      url: ->
                base = "/api/credit_cert.coffee/"
                if @isNew()
                    base
                else
                    base + @id

