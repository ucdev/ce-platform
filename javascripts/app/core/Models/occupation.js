#! ce._core.models.Occupation extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Occupation = Backbone.Model.extend
      url: ->
                base = "/api/occupations/"
                if @isNew()
                    base
                else
                    base + @id

