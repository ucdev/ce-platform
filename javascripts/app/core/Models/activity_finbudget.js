#! ce._core.models.Activity_finbudget extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finbudget = Backbone.Model.extend
      url: ->
                base = "/api/activity_finbudgets/"
                if @isNew()
                    base
                else
                    base + @id

