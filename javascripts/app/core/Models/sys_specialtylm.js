#! ce._core.models.Sys_specialtylm extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_specialtylm = Backbone.Model.extend
      url: ->
                base = "/api/sys_specialtylms/"
                if @isNew()
                    base
                else
                    base + @id

