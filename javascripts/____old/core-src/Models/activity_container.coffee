#! ce._core.models.Activity_container.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_container.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_container.coffee/"
                if @isNew()
                    base
                else
                    base + @id

