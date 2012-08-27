/*! app/models/activity_categorylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_categorylm
*/
define("app/models/activity_categorylm",["require","app"],function(require,app) {
	var Activity_categorylmModel = app.Model.extend({
		url: function() {
			base = "/api/activity_categorylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_categorylmModel)
});
