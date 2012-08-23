#! ce._core.models.Sys_emailstyle.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_emailstyle.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_emailstyle.coffee/"
                if @isNew()
                    base
                else
                    base + @id

