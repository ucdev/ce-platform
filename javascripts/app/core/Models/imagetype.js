#! ce._core.models.Imagetype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Imagetype = Backbone.Model.extend
      url: ->
                base = "/api/imagetypes/"
                if @isNew()
                    base
                else
                    base + @id

