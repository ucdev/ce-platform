#! ce._core.controllers.Assesstmpls extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Assesstmpls = (->
    assesstmpls = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("assesstmpls")
      window.col = @collection
      main.removeData "assesstmpls"
    assesstmpls::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    assesstmpls::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    assesstmpls::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    assesstmpls
  )()

