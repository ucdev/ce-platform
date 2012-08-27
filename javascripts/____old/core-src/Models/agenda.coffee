#! ce._core.models.Agenda.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Agenda.coffee = Backbone.Model.extend
      url: ->
                base = "/api/agenda.coffee/"
                if @isNew()
                    base
                else
                    base + @id

