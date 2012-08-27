#! ce._core.models.Activity_step.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_step.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_step.coffee/"
                if @isNew()
                    base
                else
                    base + @id

