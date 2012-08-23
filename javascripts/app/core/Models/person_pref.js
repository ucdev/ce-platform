#! ce._core.models.Person_pref extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_pref = Backbone.Model.extend
      url: ->
                base = "/api/person_prefs/"
                if @isNew()
                    base
                else
                    base + @id

