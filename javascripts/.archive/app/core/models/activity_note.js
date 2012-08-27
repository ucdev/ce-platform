/*! app/models/activity_note 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_note
*/
define("app/models/Activity_note",function(require,app) {
	app.models.Activity_note = app.Model.extend({
			url: function() {
				base = "/api/activity_notes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
