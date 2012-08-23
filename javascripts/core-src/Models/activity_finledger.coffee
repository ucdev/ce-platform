#! ce._core.models.Activity_finledger.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finledger.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_finledger.coffee/"
                if @isNew()
                    base
                else
                    base + @id

