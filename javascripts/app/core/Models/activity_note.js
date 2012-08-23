#! ce._core.models.Activity_note extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_note = Backbone.Model.extend
      url: ->
                base = "/api/activity_notes/"
                if @isNew()
                    base
                else
                    base + @id

