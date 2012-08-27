/*! app/models/activity_note 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_note
*/
define("app/models/activity_note",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_noteModel = AppModel.extend({
		url: function() {
			base = "/api/activity_notes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_noteModel)
});
