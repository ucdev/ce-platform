#! ce._core.models.Person_email.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_email.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_email.coffee/"
                if @isNew()
                    base
                else
                    base + @id

