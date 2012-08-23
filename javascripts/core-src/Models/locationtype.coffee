#! ce._core.models.Locationtype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Locationtype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/locationtype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

