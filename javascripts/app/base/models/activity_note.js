/*! app/models/activity_note 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_note
*/
define("app/models/activity_note",["require","app"],function(require,app) {
	var Activity_noteModel = app.Model.extend({
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
