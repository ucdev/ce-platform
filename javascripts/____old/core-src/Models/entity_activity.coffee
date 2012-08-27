#! ce._core.models.Entity_activity.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_activity.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity_activity.coffee/"
                if @isNew()
                    base
                else
                    base + @id

