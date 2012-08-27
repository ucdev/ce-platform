#! ce._core.models.Entity_entitytype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_entitytype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity_entitytype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

