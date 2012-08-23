#! ce._core.models.Degree extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Degree = Backbone.Model.extend
      url: ->
                base = "/api/degrees/"
                if @isNew()
                    base
                else
                    base + @id

