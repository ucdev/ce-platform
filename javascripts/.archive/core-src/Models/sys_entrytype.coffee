#! ce._core.models.Sys_entrytype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_entrytype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_entrytype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

