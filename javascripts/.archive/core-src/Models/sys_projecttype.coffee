#! ce._core.models.Sys_projecttype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_projecttype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_projecttype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

