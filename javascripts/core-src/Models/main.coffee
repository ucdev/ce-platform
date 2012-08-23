#! ce._core.models.Main.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Main.coffee = Backbone.Model.extend
      url: ->
                base = "/api/main.coffee/"
                if @isNew()
                    base
                else
                    base + @id

