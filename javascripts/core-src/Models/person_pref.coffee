#! ce._core.models.Person_pref.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_pref.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_pref.coffee/"
                if @isNew()
                    base
                else
                    base + @id

