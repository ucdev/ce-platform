#! ce._core.models.Sys_supporttype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_supporttype = Backbone.Model.extend
      url: ->
                base = "/api/sys_supporttypes/"
                if @isNew()
                    base
                else
                    base + @id

