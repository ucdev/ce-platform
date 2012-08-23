#! ce._core.models.Stat_entry extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Stat_entry = Backbone.Model.extend
      url: ->
                base = "/api/stat_entries/"
                if @isNew()
                    base
                else
                    base + @id

