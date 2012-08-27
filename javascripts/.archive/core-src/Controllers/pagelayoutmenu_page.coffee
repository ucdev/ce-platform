#! ce._core.controllers.Pagelayoutmenu_page.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Pagelayoutmenu_page.coffee = (->
    pagelayoutmenu_page.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("pagelayoutmenu_page.coffee")
      window.col = @collection
      main.removeData "pagelayoutmenu_page.coffee"
    pagelayoutmenu_page.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    pagelayoutmenu_page.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenu_page.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenu_page.coffee
  )()

