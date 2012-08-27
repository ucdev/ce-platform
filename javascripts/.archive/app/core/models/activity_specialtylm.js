/*! app/models/activity_specialtylm 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_specialtylm
*/
define("app/models/Activity_specialtylm",function(require,app) {
	app.models.Activity_specialtylm = app.Model.extend({
			url: function() {
				base = "/api/activity_specialtylms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
