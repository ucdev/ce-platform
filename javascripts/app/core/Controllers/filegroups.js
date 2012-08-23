#! ce._core.controllers.Filegroups extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Filegroups = (->
    filegroups = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("filegroups")
      window.col = @collection
      main.removeData "filegroups"
    filegroups::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    filegroups::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    filegroups::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    filegroups
  )()

