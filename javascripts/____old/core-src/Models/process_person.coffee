#! ce._core.models.Process_person.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Process_person.coffee = Backbone.Model.extend
      url: ->
                base = "/api/process_person.coffee/"
                if @isNew()
                    base
                else
                    base + @id

