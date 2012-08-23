#! ce._core.models.Activity_container extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_container = Backbone.Model.extend
      url: ->
                base = "/api/activity_containers/"
                if @isNew()
                    base
                else
                    base + @id

