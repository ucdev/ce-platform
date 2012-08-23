#! ce._core.models.Pagelayout extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Pagelayout = Backbone.Model.extend
      url: ->
                base = "/api/pagelayouts/"
                if @isNew()
                    base
                else
                    base + @id

