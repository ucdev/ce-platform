#! ce._core.models.Activity_profile extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_profile = Backbone.Model.extend
      url: ->
                base = "/api/activity_profiles/"
                if @isNew()
                    base
                else
                    base + @id

