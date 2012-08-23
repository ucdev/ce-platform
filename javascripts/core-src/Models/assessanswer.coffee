#! ce._core.models.Assessanswer.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessanswer.coffee = Backbone.Model.extend
      url: ->
                base = "/api/assessanswer.coffee/"
                if @isNew()
                    base
                else
                    base + @id

