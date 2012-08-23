#! ce._core.models.Person_specialtylm extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_specialtylm = Backbone.Model.extend
      url: ->
                base = "/api/person_specialtylms/"
                if @isNew()
                    base
                else
                    base + @id

