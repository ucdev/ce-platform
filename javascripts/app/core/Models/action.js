#! ce._core.models.Action extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Action = Backbone.Model.extend
      url: ->
                base = "/api/actions/"
                if @isNew()
                    base
                else
                    base + @id

