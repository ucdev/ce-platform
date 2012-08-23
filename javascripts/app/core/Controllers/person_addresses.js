#! ce._core.controllers.Person_addresses extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_addresses = (->
    person_addresses = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_addresses")
      window.col = @collection
      main.removeData "person_addresses"
    person_addresses::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_addresses::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_addresses::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_addresses
  )()

