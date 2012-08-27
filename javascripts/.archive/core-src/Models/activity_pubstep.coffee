#! ce._core.models.Activity_pubstep.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_pubstep.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_pubstep.coffee/"
                if @isNew()
                    base
                else
                    base + @id

