#! ce._core.models.Assessresult extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessresult = Backbone.Model.extend
      url: ->
                base = "/api/assessresults/"
                if @isNew()
                    base
                else
                    base + @id

