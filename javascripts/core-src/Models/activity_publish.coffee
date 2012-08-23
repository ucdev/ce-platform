#! ce._core.models.Activity_publish.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_publish.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_publish.coffee/"
                if @isNew()
                    base
                else
                    base + @id

