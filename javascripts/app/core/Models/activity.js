#! ce._core.models.Activity extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity = Backbone.Model.extend
      url: ->
                base = "/api/activities/"
                if @isNew()
                    base
                else
                    base + @id

