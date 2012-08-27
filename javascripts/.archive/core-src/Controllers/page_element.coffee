#! ce._core.controllers.Page_element.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Page_element.coffee = (->
    page_element.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("page_element.coffee")
      window.col = @collection
      main.removeData "page_element.coffee"
    page_element.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    page_element.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    page_element.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    page_element.coffee
  )()

