#! ce._core.models.Objecttype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objecttype = Backbone.Model.extend
      url: ->
                base = "/api/objecttypes/"
                if @isNew()
                    base
                else
                    base + @id

