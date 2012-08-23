#! ce._core.controllers.Accounts extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Accounts = (->
    accounts = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("accounts")
      window.col = @collection
      main.removeData "accounts"
    accounts::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    accounts::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    accounts::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    accounts
  )()

