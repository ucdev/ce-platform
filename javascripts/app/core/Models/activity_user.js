#! ce._core.models.Activity_user extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_user = Backbone.Model.extend
      url: ->
                base = "/api/activity_users/"
                if @isNew()
                    base
                else
                    base + @id

