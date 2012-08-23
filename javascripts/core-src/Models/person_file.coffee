#! ce._core.models.Person_file.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_file.coffee = Backbone.Model.extend
      url: ->
                base = "/api/person_file.coffee/"
                if @isNew()
                    base
                else
                    base + @id

