
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
  self.model = new models.Activity(params.modelData)
  #self.trigger "loaded"

#self.on "loaded", ->
  #app.log.info "activity: loaded"

exports.activity = self