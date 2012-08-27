#! ce._core.models.Professionarea.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Professionarea.coffee = Backbone.Model.extend
      url: ->
                base = "/api/professionarea.coffee/"
                if @isNew()
                    base
                else
                    base + @id

