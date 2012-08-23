#! ce._core.controllers.Pages extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Pages = (->
    pages = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("pages")
      window.col = @collection
      main.removeData "pages"
    pages::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    pages::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    pages::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    pages
  )()

