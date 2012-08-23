#! ce._core.models.Activity_pubcomponent extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_pubcomponent = Backbone.Model.extend
      url: ->
                base = "/api/activity_pubcomponents/"
                if @isNew()
                    base
                else
                    base + @id

