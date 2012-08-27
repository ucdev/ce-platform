#! ce._core.models.Activity_tag.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_tag.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_tag.coffee/"
                if @isNew()
                    base
                else
                    base + @id

