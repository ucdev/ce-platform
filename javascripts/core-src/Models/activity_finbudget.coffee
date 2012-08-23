#! ce._core.models.Activity_finbudget.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finbudget.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_finbudget.coffee/"
                if @isNew()
                    base
                else
                    base + @id

