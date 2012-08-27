/*! app/models/activity_finledger 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finledger
*/
define("app/models/activity_finledger",["require","app"],function(require,app) {
	var Activity_finledgerModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finledgers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finledgerModel)
});
