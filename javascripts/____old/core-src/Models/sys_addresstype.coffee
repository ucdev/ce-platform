#! ce._core.models.Sys_addresstype.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_addresstype.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_addresstype.coffee/"
                if @isNew()
                    base
                else
                    base + @id

