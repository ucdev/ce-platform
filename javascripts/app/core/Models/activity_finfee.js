#! ce._core.models.Activity_finfee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finfee = Backbone.Model.extend
      url: ->
                base = "/api/activity_finfees/"
                if @isNew()
                    base
                else
                    base + @id

