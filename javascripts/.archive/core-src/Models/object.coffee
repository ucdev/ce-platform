#! ce._core.models.Object.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Object.coffee = Backbone.Model.extend
      url: ->
                base = "/api/object.coffee/"
                if @isNew()
                    base
                else
                    base + @id

