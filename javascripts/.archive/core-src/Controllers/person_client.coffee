#! ce._core.controllers.Person_client.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_client.coffee = (->
    person_client.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_client.coffee")
      window.col = @collection
      main.removeData "person_client.coffee"
    person_client.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_client.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_client.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_client.coffee
  )()

