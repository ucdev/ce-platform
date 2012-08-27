#! ce._core.models.Cert.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Cert.coffee = Backbone.Model.extend
      url: ->
                base = "/api/cert.coffee/"
                if @isNew()
                    base
                else
                    base + @id

