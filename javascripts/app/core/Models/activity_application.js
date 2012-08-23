#! ce._core.models.Activity_application extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_application = Backbone.Model.extend
      url: ->
                base = "/api/activity_applications/"
                if @isNew()
                    base
                else
                    base + @id

