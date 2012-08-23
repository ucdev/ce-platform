#! ce._core.models.Activity_publish extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_publish = Backbone.Model.extend
      url: ->
                base = "/api/activity_publishes/"
                if @isNew()
                    base
                else
                    base + @id

