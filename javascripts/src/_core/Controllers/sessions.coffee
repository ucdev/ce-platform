#! ce._core.controllers.Sessions extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Sessions = (->
    sessions = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("sessions")
      window.col = @collection
      main.removeData "sessions"
    sessions::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    sessions::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    sessions::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    sessions
  )()

