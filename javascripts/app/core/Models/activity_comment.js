#! ce._core.models.Activity_comment extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_comment = Backbone.Model.extend
      url: ->
                base = "/api/activity_comments/"
                if @isNew()
                    base
                else
                    base + @id

