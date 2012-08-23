#! ce._core.models.Entity_entityrole extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_entityrole = Backbone.Model.extend
      url: ->
                base = "/api/entity_entityroles/"
                if @isNew()
                    base
                else
                    base + @id

