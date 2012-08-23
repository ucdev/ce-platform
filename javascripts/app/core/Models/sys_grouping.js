#! ce._core.models.Sys_grouping extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_grouping = Backbone.Model.extend
      url: ->
                base = "/api/sys_groupings/"
                if @isNew()
                    base
                else
                    base + @id

