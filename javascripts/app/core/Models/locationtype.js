#! ce._core.models.Locationtype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Locationtype = Backbone.Model.extend
      url: ->
                base = "/api/locationtypes/"
                if @isNew()
                    base
                else
                    base + @id

