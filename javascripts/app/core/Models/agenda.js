#! ce._core.models.Agenda extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Agenda = Backbone.Model.extend
      url: ->
                base = "/api/agendas/"
                if @isNew()
                    base
                else
                    base + @id

