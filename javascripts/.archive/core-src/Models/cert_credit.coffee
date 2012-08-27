#! ce._core.models.Cert_credit.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Cert_credit.coffee = Backbone.Model.extend
      url: ->
                base = "/api/cert_credit.coffee/"
                if @isNew()
                    base
                else
                    base + @id

