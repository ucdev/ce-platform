#! ce._core.models.Sys_projecttype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_projecttype = Backbone.Model.extend
      url: ->
                base = "/api/sys_projecttypes/"
                if @isNew()
                    base
                else
                    base + @id

