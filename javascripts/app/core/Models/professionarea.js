#! ce._core.models.Professionarea extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Professionarea = Backbone.Model.extend
      url: ->
                base = "/api/professionareas/"
                if @isNew()
                    base
                else
                    base + @id

