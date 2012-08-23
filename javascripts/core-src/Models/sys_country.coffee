#! ce._core.models.Sys_country.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_country.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_country.coffee/"
                if @isNew()
                    base
                else
                    base + @id

