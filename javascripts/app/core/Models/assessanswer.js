#! ce._core.models.Assessanswer extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assessanswer = Backbone.Model.extend
      url: ->
                base = "/api/assessanswers/"
                if @isNew()
                    base
                else
                    base + @id

