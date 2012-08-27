#! ce._core.models.Assessresult.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessresult.coffee = Backbone.Model.extend
      url: ->
                base = "/api/assessresult.coffee/"
                if @isNew()
                    base
                else
                    base + @id

