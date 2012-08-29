ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
  self.Dialog = Backbone.Marionette.Region.extend 
    el: "#dialog",

    constructor: ->
      _.bindAll this
      
      Backbone.Marionette.Region.prototype.constructor.apply @, arguments
      @.on "view:show", @showDialog, @

      return
    ,

    getEl: (selector) ->
      $el = $(selector).dialog()
      $el.on "hidden", @close
      return $el;
    ,

    showDialog: (view) ->
      view.on("close", @hideDialog, @);
      @$el.dialog('open');
      return
    ,

    hideDialog: ->
      @$el.dialog('close');
      return
  return
  
ce.addRegions dialog: ce.ui.Dialog