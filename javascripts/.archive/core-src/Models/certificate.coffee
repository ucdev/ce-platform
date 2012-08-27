#! ce._core.models.Certificate.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Certificate.coffee = Backbone.Model.extend
      url: ->
                base = "/api/certificate.coffee/"
                if @isNew()
                    base
                else
                    base + @id

