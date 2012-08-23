#! ce._core.models.Sys_supporttype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_supporttype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_supporttype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

