#! ce._core.controllers.Certificates extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Certificates = (->
    certificates = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("certificates")
      window.col = @collection
      main.removeData "certificates"
    certificates::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    certificates::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    certificates::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    certificates
  )()

