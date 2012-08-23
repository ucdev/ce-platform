#! ce._core.models.Person_client extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_client = Backbone.Model.extend
      url: ->
                base = "/api/person_clients/"
                if @isNew()
                    base
                else
                    base + @id

