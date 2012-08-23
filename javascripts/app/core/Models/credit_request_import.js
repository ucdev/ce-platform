#! ce._core.models.Credit_request_import extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Credit_request_import = Backbone.Model.extend
      url: ->
                base = "/api/credit_request_imports/"
                if @isNew()
                    base
                else
                    base + @id

