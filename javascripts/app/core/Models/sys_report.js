#! ce._core.models.Sys_report extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_report = Backbone.Model.extend
      url: ->
                base = "/api/sys_reports/"
                if @isNew()
                    base
                else
                    base + @id

