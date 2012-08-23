#! ce._core.models.Activity_credit extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_credit = Backbone.Model.extend
      url: ->
                base = "/api/activity_credits/"
                if @isNew()
                    base
                else
                    base + @id

