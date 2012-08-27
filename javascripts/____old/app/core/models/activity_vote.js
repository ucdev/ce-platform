/*! app/models/activity_vote 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_vote
*/
define("app/models/Activity_vote",function(require,app) {
	app.models.Activity_vote = app.Model.extend({
			url: function() {
				base = "/api/activity_votes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
