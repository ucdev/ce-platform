#! ce._core.models.Activity_other.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_other.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_other.coffee/"
                if @isNew()
                    base
                else
                    base + @id

