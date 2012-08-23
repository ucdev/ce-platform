#! ce._core.models.Process_person extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Process_person = Backbone.Model.extend
      url: ->
                base = "/api/process_persons/"
                if @isNew()
                    base
                else
                    base + @id

