#! ce._core.models.Processmanager.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Processmanager.coffee = Backbone.Model.extend
      url: ->
                base = "/api/processmanager.coffee/"
                if @isNew()
                    base
                else
                    base + @id

