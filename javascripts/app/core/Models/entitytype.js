#! ce._core.models.Entitytype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entitytype = Backbone.Model.extend
      url: ->
                base = "/api/entitytypes/"
                if @isNew()
                    base
                else
                    base + @id

