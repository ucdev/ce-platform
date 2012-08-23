#! ce._core.models.Person_user.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_user.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_user.coffee/"
                if @isNew()
                    base
                else
                    base + @id

