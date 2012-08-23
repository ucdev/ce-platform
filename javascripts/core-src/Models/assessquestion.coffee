#! ce._core.models.Assessquestion.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessquestion.coffee = Backbone.Model.extend
      url: ->
                base = "/api/assessquestion.coffee/"
                if @isNew()
                    base
                else
                    base + @id

