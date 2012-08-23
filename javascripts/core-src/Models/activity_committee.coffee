#! ce._core.models.Activity_committee.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Activity_committee.coffee = Backbone.Model.extend
      url: ->
                base = "/api/activity_committee.coffee/"
                if @isNew()
                    base
                else
                    base + @id

