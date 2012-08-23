#! ce._core.models.Account.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Account.coffee = Backbone.Model.extend
      url: ->
                base = "/api/account.coffee/"
                if @isNew()
                    base
                else
                    base + @id

