/*! app/models/activity_specialtylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_specialtylm
*/
define("app/models/activity_specialtylm",["require","app"],function(require,app) {
	var Activity_specialtylmModel = app.Model.extend({
		url: function() {
			base = "/api/activity_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_specialtylmModel)
});
