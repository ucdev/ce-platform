#! ce._core.models.Activity_site extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_site = Backbone.Model.extend
      url: ->
                base = "/api/activity_sites/"
                if @isNew()
                    base
                else
                    base + @id

