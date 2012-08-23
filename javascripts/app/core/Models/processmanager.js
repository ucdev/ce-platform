#! ce._core.models.Processmanager extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Processmanager = Backbone.Model.extend
      url: ->
                base = "/api/processmanagers/"
                if @isNew()
                    base
                else
                    base + @id

