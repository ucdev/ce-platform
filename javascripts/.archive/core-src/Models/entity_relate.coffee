#! ce._core.models.Entity_relate.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_relate.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity_relate.coffee/"
                if @isNew()
                    base
                else
                    base + @id

