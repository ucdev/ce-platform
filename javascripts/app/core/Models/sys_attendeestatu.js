#! ce._core.models.Sys_attendeestatu extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Sys_attendeestatu = Backbone.Model.extend
      url: ->
                base = "/api/sys_attendeestatuses/"
                if @isNew()
                    base
                else
                    base + @id

