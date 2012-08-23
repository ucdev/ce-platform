#! ce._core.controllers.Authorities extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Authorities = (->
    authorities = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("authorities")
      window.col = @collection
      main.removeData "authorities"
    authorities::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    authorities::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    authorities::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    authorities
  )()

