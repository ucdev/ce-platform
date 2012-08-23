#! ce._core.models.Person_note extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_note = Backbone.Model.extend
      url: ->
                base = "/api/person_notes/"
                if @isNew()
                    base
                else
                    base + @id

