#! ce._core.models.Project extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Project = Backbone.Model.extend
      url: ->
                base = "/api/projects/"
                if @isNew()
                    base
                else
                    base + @id

