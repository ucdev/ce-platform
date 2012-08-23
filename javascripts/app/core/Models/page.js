#! ce._core.models.Page extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Page = Backbone.Model.extend
      url: ->
                base = "/api/pages/"
                if @isNew()
                    base
                else
                    base + @id

