#! ce.Current.Activity extends ce.Models.Activity 
ce.module "activity", (self, ce, Backbone, Marionette, $, _) ->
  self.load = (params) ->
    self.userPrefs =
      actListHeight: params.legacy.cActListHeight
      actListOpen: params.legacy.cActListOpen
      actListPosX: params.legacy.cActListPosX
      actListPosY: params.legacy.cActListPosY
      actListWidth: params.legacy.cActListWidth
      actNotesOpen: params.legacy.cActNotesOpen
      actNotesPosX: params.legacy.cActNotesPosX
      actNotesPosY: params.legacy.cActNotesPosY

    self.legacy = params.legacy
    self.Model = new ce.Models.Activity(params.modelData)
    self.trigger "loaded"

  self.on "loaded", ->
    ce.log.info "activity: loaded"

