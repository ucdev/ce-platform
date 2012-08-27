#! ce._core.models.Sys_filetype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_filetype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_filetype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

