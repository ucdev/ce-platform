#! ce._core.controllers.Geonames extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Geonames = (->
    geonames = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("geonames")
      window.col = @collection
      main.removeData "geonames"
    geonames::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    geonames::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    geonames::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    geonames
  )()

