#! ce._core.controllers.Projects extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Projects = (->
    projects = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("projects")
      window.col = @collection
      main.removeData "projects"
    projects::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    projects::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    projects::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    projects
  )()

