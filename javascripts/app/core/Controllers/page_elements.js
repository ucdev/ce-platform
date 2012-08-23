#! ce._core.controllers.Page_elements extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Page_elements = (->
    page_elements = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("page_elements")
      window.col = @collection
      main.removeData "page_elements"
    page_elements::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    page_elements::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    page_elements::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    page_elements
  )()

