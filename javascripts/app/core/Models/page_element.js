#! ce._core.models.Page_element extends Backbone.Model 
ce.module "_core.models", (self, ce, Backbone, Marionette, $, _) ->
    self.Page_element = Backbone.Model.extend
      url: ->
                base = "/api/page_elements/"
                if @isNew()
                    base
                else
                    base + @id

