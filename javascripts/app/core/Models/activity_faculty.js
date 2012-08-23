#! ce._core.models.Activity_faculty extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_faculty = Backbone.Model.extend
      url: ->
                base = "/api/activity_faculties/"
                if @isNew()
                    base
                else
                    base + @id

