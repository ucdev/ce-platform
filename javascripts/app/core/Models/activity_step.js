#! ce._core.models.Activity_step extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_step = Backbone.Model.extend
      url: ->
                base = "/api/activity_steps/"
                if @isNew()
                    base
                else
                    base + @id

