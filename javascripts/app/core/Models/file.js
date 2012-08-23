#! ce._core.models.File extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.File = Backbone.Model.extend
      url: ->
                base = "/api/files/"
                if @isNew()
                    base
                else
                    base + @id

