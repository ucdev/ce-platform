#! ce._core.models.Credit_cert extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Credit_cert = Backbone.Model.extend
      url: ->
                base = "/api/credit_certs/"
                if @isNew()
                    base
                else
                    base + @id

