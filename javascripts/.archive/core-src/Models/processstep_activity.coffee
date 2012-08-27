#! ce._core.models.Processstep_activity.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Processstep_activity.coffee = Backbone.Model.extend
      url: ->
                base = "/api/processstep_activity.coffee/"
                if @isNew()
                    base
                else
                    base + @id

