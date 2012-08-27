/*! app/models/activity_vote 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_vote
*/
define("app/models/activity_vote",["require","app"],function(require,app) {
	var Activity_voteModel = app.Model.extend({
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
