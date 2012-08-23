#! ce._core.controllers.Page_sections extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Page_sections = (->
    page_sections = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("page_sections")
      window.col = @collection
      main.removeData "page_sections"
    page_sections::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    page_sections::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    page_sections::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    page_sections
  )()

