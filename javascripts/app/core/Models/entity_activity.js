#! ce._core.models.Entity_activity extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_activity = Backbone.Model.extend
      url: ->
                base = "/api/entity_activities/"
                if @isNew()
                    base
                else
                    base + @id

