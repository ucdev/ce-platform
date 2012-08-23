#! ce._core.models.Attendeecredit extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Attendeecredit = Backbone.Model.extend
      url: ->
                base = "/api/attendeecredits/"
                if @isNew()
                    base
                else
                    base + @id

