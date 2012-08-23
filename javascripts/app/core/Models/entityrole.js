#! ce._core.models.Entityrole extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Entityrole = Backbone.Model.extend
      url: ->
                base = "/api/entityroles/"
                if @isNew()
                    base
                else
                    base + @id

