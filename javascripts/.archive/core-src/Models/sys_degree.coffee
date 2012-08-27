#! ce._core.models.Sys_degree.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_degree.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_degree.coffee/"
                if @isNew()
                    base
                else
                    base + @id

