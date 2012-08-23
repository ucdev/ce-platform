#! ce._core.models.Entity_credit extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entity_credit = Backbone.Model.extend
      url: ->
                base = "/api/entity_credits/"
                if @isNew()
                    base
                else
                    base + @id

