#! ce._core.models.Model.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Model.coffee = Backbone.Model.extend
      url: ->
                base = "/api/model.coffee/"
                if @isNew()
                    base
                else
                    base + @id

