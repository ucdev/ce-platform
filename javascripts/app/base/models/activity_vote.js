/*! app/models/activity_vote 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_vote
*/
define("app/models/activity_vote",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_voteModel = AppModel.extend({
		url: function() {
			base = "/api/activity_votes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_voteModel)
});
