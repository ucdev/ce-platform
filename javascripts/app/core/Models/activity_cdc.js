#! ce._core.models.Activity_cdc extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_cdc = Backbone.Model.extend
      url: ->
                base = "/api/activity_cdcs/"
                if @isNew()
                    base
                else
                    base + @id

