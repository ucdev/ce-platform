#! ce._core.controllers.Comments extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Comments = (->
    comments = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("comments")
      window.col = @collection
      main.removeData "comments"
    comments::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    comments::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    comments::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    comments
  )()

