#! ce._core.models.Attendeecredit.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendeecredit.coffee = Backbone.Model.extend
      url: ->
                base = "/api/attendeecredit.coffee/"
                if @isNew()
                    base
                else
                    base + @id

