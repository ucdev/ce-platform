#! ce._core.models.Objectfield.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectfield.coffee = Backbone.Model.extend
      url: ->
                base = "/api/objectfield.coffee/"
                if @isNew()
                    base
                else
                    base + @id

