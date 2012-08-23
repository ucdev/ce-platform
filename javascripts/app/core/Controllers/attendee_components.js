#! ce._core.controllers.Attendee_components extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Attendee_components = (->
    attendee_components = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("attendee_components")
      window.col = @collection
      main.removeData "attendee_components"
    attendee_components::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    attendee_components::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    attendee_components::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    attendee_components
  )()

