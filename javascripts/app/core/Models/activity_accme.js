#! ce._core.models.Activity_accme extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_accme = Backbone.Model.extend
      url: ->
                base = "/api/activity_accmes/"
                if @isNew()
                    base
                else
                    base + @id

