#! ce._core.models.Image extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Image = Backbone.Model.extend
      url: ->
                base = "/api/images/"
                if @isNew()
                    base
                else
                    base + @id

