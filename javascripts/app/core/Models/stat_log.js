#! ce._core.models.Stat_log extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Stat_log = Backbone.Model.extend
      url: ->
                base = "/api/stat_logs/"
                if @isNew()
                    base
                else
                    base + @id

