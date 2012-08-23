#! ce._core.models.Image.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Image.coffee = Backbone.Model.extend
      url: ->
                base = "/api/image.coffee/"
                if @isNew()
                    base
                else
                    base + @id

