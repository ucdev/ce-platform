#! ce._core.controllers.Categories extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Categories = (->
    categories = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("categories")
      window.col = @collection
      main.removeData "categories"
    categories::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    categories::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    categories::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    categories
  )()

