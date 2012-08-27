#! ce._core.models.Occupation.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Occupation.coffee = Backbone.Model.extend
      url: ->
                base = "/api/occupation.coffee/"
                if @isNew()
                    base
                else
                    base + @id

