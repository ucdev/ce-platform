#! ce._core.models.Assessquestion extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessquestion = Backbone.Model.extend
      url: ->
                base = "/api/assessquestions/"
                if @isNew()
                    base
                else
                    base + @id

