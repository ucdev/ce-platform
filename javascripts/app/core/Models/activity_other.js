#! ce._core.models.Activity_other extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_other = Backbone.Model.extend
      url: ->
                base = "/api/activity_others/"
                if @isNew()
                    base
                else
                    base + @id

