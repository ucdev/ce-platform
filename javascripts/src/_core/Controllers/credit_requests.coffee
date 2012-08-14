#! ce._core.controllers.Credit_requests extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Credit_requests = (->
    credit_requests = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("credit_requests")
      window.col = @collection
      main.removeData "credit_requests"
    credit_requests::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    credit_requests::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    credit_requests::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    credit_requests
  )()

