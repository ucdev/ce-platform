#! ce._core.models.Location.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Location.coffee = Backbone.Model.extend
      url: ->
                base = "/api/location.coffee/"
                if @isNew()
                    base
                else
                    base + @id

