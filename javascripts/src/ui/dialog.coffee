ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
  self.dialog = Backbone.Marionette.Region.extend(
    el: "#dialog"
    constructor: ->
      _.bindAll this
      Backbone.Marionette.Region::constructor.apply this, arguments
      @on "view:show", @showDialog, this
      return

    getEl: (selector) ->
      $el = $(selector).dialog()
      $el.on "hidden", @close
      return

    showDialog: (view) ->
      view.on "close", @hideDialog, this
      @$el.dialog view
      @$el.dialog "open"
      return

    hideDialog: ->
      @$el.dialog "close"
      return
  )

ce.addRegions dialog: ce.ui.dialog