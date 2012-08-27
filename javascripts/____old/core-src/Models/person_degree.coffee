#! ce._core.models.Person_degree.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_degree.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_degree.coffee/"
                if @isNew()
                    base
                else
                    base + @id

