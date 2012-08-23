#! ce._core.models.Person_user extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_user = Backbone.Model.extend
      url: ->
                base = "/api/person_users/"
                if @isNew()
                    base
                else
                    base + @id

