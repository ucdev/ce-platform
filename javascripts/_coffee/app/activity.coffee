define "app/activity",["require","backbone"],(require,Backbone) ->
    activity = {}
    activity.Model = require("app/models/activity")
    activity.load = (params) ->
        activity.userPrefs =
            actListHeight: params.legacy.cActListHeight
            actListOpen: params.legacy.cActListOpen
            actListPosX: params.legacy.cActListPosX
            actListPosY: params.legacy.cActListPosY
            actListWidth: params.legacy.cActListWidth
            actNotesOpen: params.legacy.cActNotesOpen
            actNotesPosX: params.legacy.cActNotesPosX
            actNotesPosY: params.legacy.cActNotesPosY

        activity.legacy = params.legacy
        activity.model = new activity.Model(params.modelData)
        #self.trigger "loaded"

    #self.on "loaded", ->
        #app.log.info "activity: loaded"

    module.setExports(activity)
    return