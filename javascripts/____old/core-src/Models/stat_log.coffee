#! ce._core.models.Stat_log.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Stat_log.coffee = Backbone.Model.extend
      url: ->
                base = "/api/stat_log.coffee/"
                if @isNew()
                    base
                else
                    base + @id

