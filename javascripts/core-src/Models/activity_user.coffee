#! ce._core.models.Activity_user.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_user.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_user.coffee/"
                if @isNew()
                    base
                else
                    base + @id

