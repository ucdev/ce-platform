#! ce._core.models.Category.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Category.coffee = Backbone.Model.extend
      url: ->
                base = "/api/category.coffee/"
                if @isNew()
                    base
                else
                    base + @id

