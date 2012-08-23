#! ce._core.models.Sys_attendeestatu.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_attendeestatu.coffee = Backbone.Model.extend
      url: ->
                base = "/api/sys_attendeestatu.coffee/"
                if @isNew()
                    base
                else
                    base + @id

