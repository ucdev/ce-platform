#! ce._core.controllers.Person_prefs extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_prefs = (->
    person_prefs = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_prefs")
      window.col = @collection
      main.removeData "person_prefs"
    person_prefs::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_prefs::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_prefs::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_prefs
  )()

