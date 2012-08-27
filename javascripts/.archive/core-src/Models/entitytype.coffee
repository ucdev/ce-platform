#! ce._core.models.Entitytype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entitytype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entitytype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

