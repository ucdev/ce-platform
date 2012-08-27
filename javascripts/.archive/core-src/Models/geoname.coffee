#! ce._core.models.Geoname.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Geoname.coffee = Backbone.Model.extend
      url: ->
                base = "/api/geoname.coffee/"
                if @isNew()
                    base
                else
                    base + @id

