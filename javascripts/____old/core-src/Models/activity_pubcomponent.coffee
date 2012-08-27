#! ce._core.models.Activity_pubcomponent.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_pubcomponent.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_pubcomponent.coffee/"
                if @isNew()
                    base
                else
                    base + @id

