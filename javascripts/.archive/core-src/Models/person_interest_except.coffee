#! ce._core.models.Person_interest_except.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_interest_except.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_interest_except.coffee/"
                if @isNew()
                    base
                else
                    base + @id

