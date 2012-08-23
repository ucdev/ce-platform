#! ce._core.models.Grouptype extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Grouptype = Backbone.Model.extend
      url: ->
                base = "/api/grouptypes/"
                if @isNew()
                    base
                else
                    base + @id

