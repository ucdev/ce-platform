#! ce._core.models.Sys_grouptype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_grouptype = Backbone.Model.extend
      url: ->
                base = "/api/sys_grouptypes/"
                if @isNew()
                    base
                else
                    base + @id

