#! ce._core.controllers.Person_notes extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_notes = (->
    person_notes = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_notes")
      window.col = @collection
      main.removeData "person_notes"
    person_notes::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_notes::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_notes::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_notes
  )()

