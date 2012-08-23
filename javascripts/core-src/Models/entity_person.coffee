#! ce._core.models.Entity_person.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_person.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity_person.coffee/"
                if @isNew()
                    base
                else
                    base + @id

