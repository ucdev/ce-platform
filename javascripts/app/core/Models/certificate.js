#! ce._core.models.Certificate extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Certificate = Backbone.Model.extend
      url: ->
                base = "/api/certificates/"
                if @isNew()
                    base
                else
                    base + @id

