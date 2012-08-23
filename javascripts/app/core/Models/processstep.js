#! ce._core.models.Processstep extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Processstep = Backbone.Model.extend
      url: ->
                base = "/api/processsteps/"
                if @isNew()
                    base
                else
                    base + @id

