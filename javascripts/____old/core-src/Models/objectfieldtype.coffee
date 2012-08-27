#! ce._core.models.Objectfieldtype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectfieldtype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/objectfieldtype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

