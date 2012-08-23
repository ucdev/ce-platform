#! ce._core.models.Hub extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Hub = Backbone.Model.extend
      url: ->
                base = "/api/hubs/"
                if @isNew()
                    base
                else
                    base + @id

