#! ce._core.controllers.Person_specialtylms extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_specialtylms = (->
    person_specialtylms = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_specialtylms")
      window.col = @collection
      main.removeData "person_specialtylms"
    person_specialtylms::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_specialtylms::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_specialtylms::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_specialtylms
  )()

