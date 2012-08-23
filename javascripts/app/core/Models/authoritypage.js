#! ce._core.models.Authoritypage extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Authoritypage = Backbone.Model.extend
      url: ->
                base = "/api/authoritypages/"
                if @isNew()
                    base
                else
                    base + @id

