#! ce._core.models.Sys_grouptype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_grouptype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_grouptype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

