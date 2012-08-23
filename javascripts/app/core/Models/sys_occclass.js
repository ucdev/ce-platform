#! ce._core.models.Sys_occclass extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_occclass = Backbone.Model.extend
      url: ->
                base = "/api/sys_occclasses/"
                if @isNew()
                    base
                else
                    base + @id

