#! ce._core.models.Assesssection extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assesssection = Backbone.Model.extend
      url: ->
                base = "/api/assesssections/"
                if @isNew()
                    base
                else
                    base + @id

