#! ce._core.models.Activity_site.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_site.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_site.coffee/"
                if @isNew()
                    base
                else
                    base + @id

