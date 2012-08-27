/*! app/models/activity_pubcomponent 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubcomponent
*/
define("app/models/activity_pubcomponent",["require","app"],function(require,app) {
	var Activity_pubcomponentModel = app.Model.extend({
		url: function() {
			base = "/api/activity_pubcomponents/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_pubcomponentModel)
});
