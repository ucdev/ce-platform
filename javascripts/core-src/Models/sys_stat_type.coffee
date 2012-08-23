#! ce._core.models.Sys_stat_type.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_stat_type.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_stat_type.coffee/"
                if @isNew()
                    base
                else
                    base + @id

