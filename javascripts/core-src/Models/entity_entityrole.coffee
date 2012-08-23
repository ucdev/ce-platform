#! ce._core.models.Entity_entityrole.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_entityrole.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity_entityrole.coffee/"
                if @isNew()
                    base
                else
                    base + @id

