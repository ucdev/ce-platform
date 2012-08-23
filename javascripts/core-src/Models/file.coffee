#! ce._core.models.File.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.File.coffee = Backbone.Model.extend
      url: ->
                base = "/api/file.coffee/"
                if @isNew()
                    base
                else
                    base + @id

