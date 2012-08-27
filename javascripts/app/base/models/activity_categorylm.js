/*! app/models/activity_categorylm 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_categorylm
*/
define("app/models/activity_categorylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_categorylmModel = AppModel.extend({
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
