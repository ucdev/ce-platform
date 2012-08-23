#! ce._core.controllers.Attendee_addresses extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Attendee_addresses = (->
    attendee_addresses = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("attendee_addresses")
      window.col = @collection
      main.removeData "attendee_addresses"
    attendee_addresses::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    attendee_addresses::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    attendee_addresses::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    attendee_addresses
  )()

