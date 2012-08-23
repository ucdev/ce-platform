#! ce._core.models.Person_address.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_address.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_address.coffee/"
                if @isNew()
                    base
                else
                    base + @id

