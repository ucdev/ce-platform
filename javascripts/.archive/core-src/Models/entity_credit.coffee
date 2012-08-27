#! ce._core.models.Entity_credit.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_credit.coffee = Backbone.Model.extend
      url: ->
                base = "/api/entity_credit.coffee/"
                if @isNew()
                    base
                else
                    base + @id

