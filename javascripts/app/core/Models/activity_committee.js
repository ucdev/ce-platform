#! ce._core.models.Activity_committee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_committee = Backbone.Model.extend
      url: ->
                base = "/api/activity_committees/"
                if @isNew()
                    base
                else
                    base + @id

