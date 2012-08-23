#! ce._core.models.Attendeecdc.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendeecdc.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendeecdc.coffee/"
                if @isNew()
                    base
                else
                    base + @id

