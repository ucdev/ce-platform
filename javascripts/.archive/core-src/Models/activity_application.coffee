#! ce._core.models.Activity_application.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_application.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_application.coffee/"
                if @isNew()
                    base
                else
                    base + @id

