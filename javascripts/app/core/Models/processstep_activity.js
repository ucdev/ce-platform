#! ce._core.models.Processstep_activity extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Processstep_activity = Backbone.Model.extend
      url: ->
                base = "/api/processstep_activities/"
                if @isNew()
                    base
                else
                    base + @id

