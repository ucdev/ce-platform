#! ce._core.models.Process extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Process = Backbone.Model.extend
      url: ->
                base = "/api/processes/"
                if @isNew()
                    base
                else
                    base + @id

