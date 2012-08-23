#! ce._core.models.Degree_credit extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Degree_credit = Backbone.Model.extend
      url: ->
                base = "/api/degree_credits/"
                if @isNew()
                    base
                else
                    base + @id

