#! ce._core.models.Sys_grouping.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_grouping.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_grouping.coffee/"
                if @isNew()
                    base
                else
                    base + @id

