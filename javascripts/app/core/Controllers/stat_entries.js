#! ce._core.controllers.Stat_entries extends Backbone.Controller 
ce.module "_core.controllers", (self, ce, Backbone, Marionette, $, _) ->
  @Stat_entries = (->
    stat_entries = ->
      main = undefined
      @collection = new self.collection
      main = $("#app")
      @collection.reset main.data("stat_entries")
      window.col = @collection
      main.removeData "stat_entries"
    stat_entries::indexView = ->
      view = undefined
      view = new self.views.indexView(collection: @collection)
      ce.mainRegion.show view

    stat_entries::editView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.editView(model: obj)
      ce.mainRegion.show view

    stat_entries::showView = (id) ->
      obj = undefined
      view = undefined
      obj = @collection.get(id)
      view = new self.views.showView(model: obj)
      ce.mainRegion.show view

    stat_entries
  )()

