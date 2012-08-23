#! ce._core.models.Grouptype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Grouptype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/grouptype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

