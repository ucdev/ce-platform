#! ce._core.models.Activity_cdc.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_cdc.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_cdc.coffee/"
                if @isNew()
                    base
                else
                    base + @id

