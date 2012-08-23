#! ce._core.models.Sys_assesstype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_assesstype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_assesstype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

