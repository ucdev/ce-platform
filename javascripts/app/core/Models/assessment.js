#! ce._core.models.Assessment extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessment = Backbone.Model.extend
      url: ->
                base = "/api/assessments/"
                if @isNew()
                    base
                else
                    base + @id

