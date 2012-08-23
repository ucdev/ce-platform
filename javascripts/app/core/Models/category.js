#! ce._core.models.Category extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Category = Backbone.Model.extend
      url: ->
                base = "/api/categories/"
                if @isNew()
                    base
                else
                    base + @id

