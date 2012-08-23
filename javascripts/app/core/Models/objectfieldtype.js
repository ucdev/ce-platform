#! ce._core.models.Objectfieldtype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Objectfieldtype = Backbone.Model.extend
      url: ->
                base = "/api/objectfieldtypes/"
                if @isNew()
                    base
                else
                    base + @id

