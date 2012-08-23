#! ce._core.controllers.Person_interest_excepts extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_interest_excepts = (->
    person_interest_excepts = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_interest_excepts")
      window.col = @collection
      main.removeData "person_interest_excepts"
    person_interest_excepts::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_interest_excepts::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_interest_excepts::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_interest_excepts
  )()

