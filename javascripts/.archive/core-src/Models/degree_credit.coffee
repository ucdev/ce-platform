#! ce._core.models.Degree_credit.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Degree_credit.coffee = Backbone.Model.extend
      url: ->
                base = "/api/degree_credit.coffee/"
                if @isNew()
                    base
                else
                    base + @id

