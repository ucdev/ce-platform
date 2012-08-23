#! ce._core.models.Relicensure.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Relicensure.coffee = Backbone.Model.extend
      url: ->
                base = "/api/relicensure.coffee/"
                if @isNew()
                    base
                else
                    base + @id

