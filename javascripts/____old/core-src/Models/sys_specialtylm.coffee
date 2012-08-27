#! ce._core.models.Sys_specialtylm.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_specialtylm.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_specialtylm.coffee/"
                if @isNew()
                    base
                else
                    base + @id

