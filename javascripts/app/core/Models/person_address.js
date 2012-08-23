#! ce._core.models.Person_address extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Person_address = Backbone.Model.extend
      url: ->
                base = "/api/person_addresses/"
                if @isNew()
                    base
                else
                    base + @id

