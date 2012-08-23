#! ce._core.models.Account extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Account = Backbone.Model.extend
      url: ->
                base = "/api/accounts/"
                if @isNew()
                    base
                else
                    base + @id

