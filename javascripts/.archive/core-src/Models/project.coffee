#! ce._core.models.Project.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Project.coffee = Backbone.Model.extend
      url: ->
                base = "/api/project.coffee/"
                if @isNew()
                    base
                else
                    base + @id

