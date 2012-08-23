#! ce._core.models.Page_element.coffee extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Page_element.coffee = Backbone.Model.extend
      url: ->
                base = "/api/page_element.coffee/"
                if @isNew()
                    base
                else
                    base + @id

