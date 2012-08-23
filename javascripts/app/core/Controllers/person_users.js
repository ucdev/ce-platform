#! ce._core.controllers.Person_users extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_users = (->
    person_users = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_users")
      window.col = @collection
      main.removeData "person_users"
    person_users::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_users::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_users::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_users
  )()

