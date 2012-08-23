#! ce._core.models.Activity_tag extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_tag = Backbone.Model.extend
      url: ->
                base = "/api/activity_tags/"
                if @isNew()
                    base
                else
                    base + @id

