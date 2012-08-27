#! ce._core.models.Sys_report.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_report.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_report.coffee/"
                if @isNew()
                    base
                else
                    base + @id

