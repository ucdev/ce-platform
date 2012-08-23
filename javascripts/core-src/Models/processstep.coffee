#! ce._core.models.Processstep.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Processstep.coffee = Backbone.Model.extend
      url: ->
                base = "/api/processstep.coffee/"
                if @isNew()
                    base
                else
                    base + @id

