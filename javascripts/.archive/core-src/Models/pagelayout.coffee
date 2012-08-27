#! ce._core.models.Pagelayout.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Pagelayout.coffee = Backbone.Model.extend
      url: ->
                base = "/api/pagelayout.coffee/"
                if @isNew()
                    base
                else
                    base + @id

