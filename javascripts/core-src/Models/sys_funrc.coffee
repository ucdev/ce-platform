#! ce._core.models.Sys_funrc.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_funrc.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_funrc.coffee/"
                if @isNew()
                    base
                else
                    base + @id

