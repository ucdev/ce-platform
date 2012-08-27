#! ce._core.models.Sys_supporter.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_supporter.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_supporter.coffee/"
                if @isNew()
                    base
                else
                    base + @id

