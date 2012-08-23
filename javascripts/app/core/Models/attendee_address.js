#! ce._core.models.Attendee_address extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendee_address = Backbone.Model.extend
      url: ->
                base = "/api/attendee_addresses/"
                if @isNew()
                    base
                else
                    base + @id

