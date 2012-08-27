/*! app/models/action 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Action
*/
define("app/models/action",["require","app"],function(require,app) {
	var ActionModel = app.Model.extend({
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
