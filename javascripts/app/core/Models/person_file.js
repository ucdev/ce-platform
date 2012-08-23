#! ce._core.models.Person_file extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_file = Backbone.Model.extend
      url: ->
                base = "/api/person_files/"
                if @isNew()
                    base
                else
                    base + @id

