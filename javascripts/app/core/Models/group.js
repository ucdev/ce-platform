#! ce._core.models.Group extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Group = Backbone.Model.extend
      url: ->
                base = "/api/groups/"
                if @isNew()
                    base
                else
                    base + @id

