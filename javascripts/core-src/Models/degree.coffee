#! ce._core.models.Degree.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Degree.coffee = Backbone.Model.extend
      url: ->
                base = "/api/degree.coffee/"
                if @isNew()
                    base
                else
                    base + @id

