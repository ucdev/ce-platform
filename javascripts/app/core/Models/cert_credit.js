#! ce._core.models.Cert_credit extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Cert_credit = Backbone.Model.extend
      url: ->
                base = "/api/cert_credits/"
                if @isNew()
                    base
                else
                    base + @id

