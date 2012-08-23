#! ce._core.models.Activity_finsupport extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finsupport = Backbone.Model.extend
      url: ->
                base = "/api/activity_finsupports/"
                if @isNew()
                    base
                else
                    base + @id

