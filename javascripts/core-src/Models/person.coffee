#! ce._core.models.Person.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person.coffee/"
                if @isNew()
                    base
                else
                    base + @id

