#! ce._core.controllers.Certs extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Certs = (->
    certs = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("certs")
      window.col = @collection
      main.removeData "certs"
    certs::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    certs::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    certs::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    certs
  )()

