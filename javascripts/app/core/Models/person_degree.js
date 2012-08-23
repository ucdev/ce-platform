#! ce._core.models.Person_degree extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_degree = Backbone.Model.extend
      url: ->
                base = "/api/person_degrees/"
                if @isNew()
                    base
                else
                    base + @id

