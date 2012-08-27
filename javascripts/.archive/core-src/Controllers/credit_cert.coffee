#! ce._core.controllers.Credit_cert.coffee extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Credit_cert.coffee = (->
    credit_cert.coffee = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("credit_cert.coffee")
      window.col = @collection
      main.removeData "credit_cert.coffee"
    credit_cert.coffee::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    credit_cert.coffee::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    credit_cert.coffee::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    credit_cert.coffee
  )()

