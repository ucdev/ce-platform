#! ce._core.models.Sys_filetype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_filetype = Backbone.Model.extend
      url: ->
                base = "/api/sys_filetypes/"
                if @isNew()
                    base
                else
                    base + @id

