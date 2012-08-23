#! ce._core.controllers.Cert_credits extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Cert_credits = (->
    cert_credits = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("cert_credits")
      window.col = @collection
      main.removeData "cert_credits"
    cert_credits::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    cert_credits::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    cert_credits::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    cert_credits
  )()

