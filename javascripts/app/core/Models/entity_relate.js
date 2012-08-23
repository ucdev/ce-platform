#! ce._core.models.Entity_relate extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_relate = Backbone.Model.extend
      url: ->
                base = "/api/entity_relates/"
                if @isNew()
                    base
                else
                    base + @id

