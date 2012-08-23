#! ce._core.models.Activity_finledger extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finledger = Backbone.Model.extend
      url: ->
                base = "/api/activity_finledgers/"
                if @isNew()
                    base
                else
                    base + @id

