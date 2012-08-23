#! ce._core.models.Person_note.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_note.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_note.coffee/"
                if @isNew()
                    base
                else
                    base + @id

