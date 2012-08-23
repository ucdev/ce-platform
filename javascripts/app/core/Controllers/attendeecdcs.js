#! ce._core.controllers.Attendeecdcs extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Attendeecdcs = (->
    attendeecdcs = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("attendeecdcs")
      window.col = @collection
      main.removeData "attendeecdcs"
    attendeecdcs::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    attendeecdcs::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    attendeecdcs::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    attendeecdcs
  )()

