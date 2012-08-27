#! ce._core.models.Objectdatum.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectdatum.coffee = Backbone.Model.extend
      url: ->
                base = "/api/objectdatum.coffee/"
                if @isNew()
                    base
                else
                    base + @id

