#! ce._core.models.Objecttype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objecttype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/objecttype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

