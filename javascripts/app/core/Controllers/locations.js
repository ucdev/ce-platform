#! ce._core.controllers.Locations extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Locations = (->
    locations = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("locations")
      window.col = @collection
      main.removeData "locations"
    locations::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    locations::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    locations::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    locations
  )()

