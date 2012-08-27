#! ce._core.models.Person_specialtylm.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_specialtylm.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_specialtylm.coffee/"
                if @isNew()
                    base
                else
                    base + @id

