#! ce._core.controllers.Pagelayouts extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Pagelayouts = (->
    pagelayouts = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("pagelayouts")
      window.col = @collection
      main.removeData "pagelayouts"
    pagelayouts::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    pagelayouts::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    pagelayouts::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    pagelayouts
  )()

