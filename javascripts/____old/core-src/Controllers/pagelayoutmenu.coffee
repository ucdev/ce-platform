#! ce._core.controllers.Pagelayoutmenu.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Pagelayoutmenu.coffee = (->
    pagelayoutmenu.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("pagelayoutmenu.coffee")
      window.col = @collection
      main.removeData "pagelayoutmenu.coffee"
    pagelayoutmenu.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    pagelayoutmenu.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenu.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenu.coffee
  )()

