#! ce._core.models.Cert extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Cert = Backbone.Model.extend
      url: ->
                base = "/api/certs/"
                if @isNew()
                    base
                else
                    base + @id

