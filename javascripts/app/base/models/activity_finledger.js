/*! app/models/activity_finledger 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finledger
*/
define("app/models/activity_finledger",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finledgerModel = AppModel.extend({
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
