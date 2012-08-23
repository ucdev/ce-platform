#! ce._core.controllers.Person_files extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_files = (->
    person_files = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_files")
      window.col = @collection
      main.removeData "person_files"
    person_files::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_files::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_files::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_files
  )()

