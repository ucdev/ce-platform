#! ce._core.models.Activity_profile.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_profile.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_profile.coffee/"
                if @isNew()
                    base
                else
                    base + @id

