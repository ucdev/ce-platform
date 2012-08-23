#! ce._core.models.Location extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Location = Backbone.Model.extend
      url: ->
                base = "/api/locations/"
                if @isNew()
                    base
                else
                    base + @id

