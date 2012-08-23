#! ce._core.models.Activity_specialtylm.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_specialtylm.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_specialtylm.coffee/"
                if @isNew()
                    base
                else
                    base + @id

