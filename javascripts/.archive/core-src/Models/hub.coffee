#! ce._core.models.Hub.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Hub.coffee = Backbone.Model.extend
      url: ->
                base = "/api/hub.coffee/"
                if @isNew()
                    base
                else
                    base + @id

