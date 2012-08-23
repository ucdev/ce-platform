#! ce._core.models.Activity_finfee.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finfee.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_finfee.coffee/"
                if @isNew()
                    base
                else
                    base + @id

