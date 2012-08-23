#! ce._core.models.Imagetype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Imagetype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/imagetype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

