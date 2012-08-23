#! ce._core.controllers.Pagelayoutmenu_pages extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Pagelayoutmenu_pages = (->
    pagelayoutmenu_pages = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("pagelayoutmenu_pages")
      window.col = @collection
      main.removeData "pagelayoutmenu_pages"
    pagelayoutmenu_pages::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    pagelayoutmenu_pages::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenu_pages::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenu_pages
  )()

