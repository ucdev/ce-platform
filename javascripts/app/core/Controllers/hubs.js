#! ce._core.controllers.Hubs extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Hubs = (->
    hubs = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("hubs")
      window.col = @collection
      main.removeData "hubs"
    hubs::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    hubs::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    hubs::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    hubs
  )()

