#! ce._core.models.Wheel extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Wheel = Backbone.Model.extend
      url: ->
                base = "/api/wheels/"
                if @isNew()
                    base
                else
                    base + @id

