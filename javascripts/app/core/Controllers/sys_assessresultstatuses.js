#! ce._core.controllers.Sys_assessresultstatuses extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Sys_assessresultstatuses = (->
    sys_assessresultstatuses = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("sys_assessresultstatuses")
      window.col = @collection
      main.removeData "sys_assessresultstatuses"
    sys_assessresultstatuses::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    sys_assessresultstatuses::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    sys_assessresultstatuses::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    sys_assessresultstatuses
  )()

