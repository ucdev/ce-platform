#! ce._core.models.Person extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person = Backbone.Model.extend
      url: ->
                base = "/api/people/"
                if @isNew()
                    base
                else
                    base + @id

