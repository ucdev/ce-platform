#! ce._core.models.Assesssection.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assesssection.coffee = Backbone.Model.extend
      url: ->
                base = "/api/assesssection.coffee/"
                if @isNew()
                    base
                else
                    base + @id

