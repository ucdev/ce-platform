#! ce._core.models.Objectform extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectform = Backbone.Model.extend
      url: ->
                base = "/api/objectforms/"
                if @isNew()
                    base
                else
                    base + @id

