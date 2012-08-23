#! ce._core.controllers.Person_clients extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_clients = (->
    person_clients = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_clients")
      window.col = @collection
      main.removeData "person_clients"
    person_clients::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_clients::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_clients::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_clients
  )()

