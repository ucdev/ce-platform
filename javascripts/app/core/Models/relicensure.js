#! ce._core.models.Relicensure extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Relicensure = Backbone.Model.extend
      url: ->
                base = "/api/relicensures/"
                if @isNew()
                    base
                else
                    base + @id

