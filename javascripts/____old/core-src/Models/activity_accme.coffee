#! ce._core.models.Activity_accme.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_accme.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_accme.coffee/"
                if @isNew()
                    base
                else
                    base + @id

