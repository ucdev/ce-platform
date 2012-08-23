#! ce._core.models.Objectdatum extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectdatum = Backbone.Model.extend
      url: ->
                base = "/api/objectdatas/"
                if @isNew()
                    base
                else
                    base + @id

