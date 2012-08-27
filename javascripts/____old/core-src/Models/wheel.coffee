#! ce._core.models.Wheel.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Wheel.coffee = Backbone.Model.extend
      url: ->
                base = "/api/wheel.coffee/"
                if @isNew()
                    base
                else
                    base + @id

