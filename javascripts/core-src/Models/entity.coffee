#! ce._core.models.Entity.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity.coffee/"
                if @isNew()
                    base
                else
                    base + @id

