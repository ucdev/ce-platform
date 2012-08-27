#! ce._core.models.Activity_note.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_note.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_note.coffee/"
                if @isNew()
                    base
                else
                    base + @id

