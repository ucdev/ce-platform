#! ce._core.models.Assessment.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessment.coffee = Backbone.Model.extend
      url: ->
                base = "/api/assessment.coffee/"
                if @isNew()
                    base
                else
                    base + @id

