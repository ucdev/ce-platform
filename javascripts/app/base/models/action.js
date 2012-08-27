/*! app/models/action 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Action
*/
define("app/models/action",["require"],function(require) {
	var AppModel = require("app/model");
	var ActionModel = AppModel.extend({
		url: function() {
			base = "/api/actions/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ActionModel)
});
