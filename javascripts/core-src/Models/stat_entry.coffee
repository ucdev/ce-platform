#! ce._core.models.Stat_entry.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Stat_entry.coffee = Backbone.Model.extend
      url: ->
                base = "/api/stat_entry.coffee/"
                if @isNew()
                    base
                else
                    base + @id

