#! ce._core.models.Objectfield extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectfield = Backbone.Model.extend
      url: ->
                base = "/api/objectfields/"
                if @isNew()
                    base
                else
                    base + @id

