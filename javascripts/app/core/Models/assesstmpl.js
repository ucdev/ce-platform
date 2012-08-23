#! ce._core.models.Assesstmpl extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Assesstmpl = Backbone.Model.extend
      url: ->
                base = "/api/assesstmpls/"
                if @isNew()
                    base
                else
                    base + @id

