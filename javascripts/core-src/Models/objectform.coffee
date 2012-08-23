#! ce._core.models.Objectform.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectform.coffee = Backbone.Model.extend
      url: ->
                base = "/api/objectform.coffee/"
                if @isNew()
                    base
                else
                    base + @id

