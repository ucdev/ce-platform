#! ce._core.models.Person_interest_except extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_interest_except = Backbone.Model.extend
      url: ->
                base = "/api/person_interest_excepts/"
                if @isNew()
                    base
                else
                    base + @id

