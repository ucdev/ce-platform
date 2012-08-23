#! ce._core.models.Sys_emailstyle extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_emailstyle = Backbone.Model.extend
      url: ->
                base = "/api/sys_emailstyles/"
                if @isNew()
                    base
                else
                    base + @id

