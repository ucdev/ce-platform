#! ce._core.models.Sys_stat_log_type extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_stat_log_type = Backbone.Model.extend
      url: ->
                base = "/api/sys_stat_log_types/"
                if @isNew()
                    base
                else
                    base + @id

