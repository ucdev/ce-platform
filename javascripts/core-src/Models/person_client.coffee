#! ce._core.models.Person_client.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_client.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_client.coffee/"
                if @isNew()
                    base
                else
                    base + @id

