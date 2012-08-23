#! ce._core.models.Sys_entrytype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_entrytype = Backbone.Model.extend
      url: ->
                base = "/api/sys_entrytypes/"
                if @isNew()
                    base
                else
                    base + @id

