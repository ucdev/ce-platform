#! ce._core.models.Sys_ethnicity.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_ethnicity.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_ethnicity.coffee/"
                if @isNew()
                    base
                else
                    base + @id

