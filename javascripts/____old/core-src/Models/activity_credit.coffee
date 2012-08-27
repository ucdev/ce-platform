#! ce._core.models.Activity_credit.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_credit.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_credit.coffee/"
                if @isNew()
                    base
                else
                    base + @id

