#! ce._core.models.Activity_specialtylm extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_specialtylm = Backbone.Model.extend
      url: ->
                base = "/api/activity_specialtylms/"
                if @isNew()
                    base
                else
                    base + @id

