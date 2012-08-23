#! ce._core.models.Person_email extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_email = Backbone.Model.extend
      url: ->
                base = "/api/person_emails/"
                if @isNew()
                    base
                else
                    base + @id

