#! ce._core.models.Activity.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity.coffee/"
                if @isNew()
                    base
                else
                    base + @id

