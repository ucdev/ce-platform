#! ce._core.models.History extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.History = Backbone.Model.extend
      url: ->
                base = "/api/histories/"
                if @isNew()
                    base
                else
                    base + @id

