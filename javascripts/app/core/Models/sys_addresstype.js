#! ce._core.models.Sys_addresstype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_addresstype = Backbone.Model.extend
      url: ->
                base = "/api/sys_addresstypes/"
                if @isNew()
                    base
                else
                    base + @id

