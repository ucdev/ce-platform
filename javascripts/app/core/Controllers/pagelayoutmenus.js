#! ce._core.controllers.Pagelayoutmenus extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Pagelayoutmenus = (->
    pagelayoutmenus = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("pagelayoutmenus")
      window.col = @collection
      main.removeData "pagelayoutmenus"
    pagelayoutmenus::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    pagelayoutmenus::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenus::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    pagelayoutmenus
  )()

