#! ce._core.models.Activity_finsupport.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_finsupport.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_finsupport.coffee/"
                if @isNew()
                    base
                else
                    base + @id

