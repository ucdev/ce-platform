#! ce._core.models.Sys_country extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_country = Backbone.Model.extend
      url: ->
                base = "/api/sys_countries/"
                if @isNew()
                    base
                else
                    base + @id

