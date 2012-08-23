#! ce._core.models.Object extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Object = Backbone.Model.extend
      url: ->
                base = "/api/objects/"
                if @isNew()
                    base
                else
                    base + @id

