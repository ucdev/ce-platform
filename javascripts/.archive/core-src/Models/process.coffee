#! ce._core.models.Process.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Process.coffee = Backbone.Model.extend
      url: ->
                base = "/api/process.coffee/"
                if @isNew()
                    base
                else
                    base + @id

