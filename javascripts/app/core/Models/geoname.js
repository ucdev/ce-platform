#! ce._core.models.Geoname extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Geoname = Backbone.Model.extend
      url: ->
                base = "/api/geonames/"
                if @isNew()
                    base
                else
                    base + @id

