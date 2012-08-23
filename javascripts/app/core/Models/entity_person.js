#! ce._core.models.Entity_person extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_person = Backbone.Model.extend
      url: ->
                base = "/api/entity_persons/"
                if @isNew()
                    base
                else
                    base + @id

