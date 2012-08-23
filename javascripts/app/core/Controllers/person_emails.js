#! ce._core.controllers.Person_emails extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Person_emails = (->
    person_emails = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("person_emails")
      window.col = @collection
      main.removeData "person_emails"
    person_emails::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    person_emails::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    person_emails::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    person_emails
  )()

