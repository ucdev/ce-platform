#! ce._core.models.Assesstmpl.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assesstmpl.coffee = Backbone.Model.extend
      url: ->
                base = "/api/assesstmpl.coffee/"
                if @isNew()
                    base
                else
                    base + @id

