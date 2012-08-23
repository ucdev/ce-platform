#! ce._core.models.Sys_stat_type extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_stat_type = Backbone.Model.extend
      url: ->
                base = "/api/sys_stat_types/"
                if @isNew()
                    base
                else
                    base + @id

