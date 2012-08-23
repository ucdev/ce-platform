#! ce._core.models.Entity_entitytype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_entitytype = Backbone.Model.extend
      url: ->
                base = "/api/entity_entitytypes/"
                if @isNew()
                    base
                else
                    base + @id

