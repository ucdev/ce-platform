/*! app/models/activity_finledger 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finledger
*/
define("app/models/Activity_finledger",function(require,app) {
	app.models.Activity_finledger = app.Model.extend({
			url: function() {
				base = "/api/activity_finledgers/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
