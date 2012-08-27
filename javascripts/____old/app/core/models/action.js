/*! app/models/action 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Action
*/
define("app/models/Action",function(require,app) {
	app.models.Action = app.Model.extend({
			url: function() {
				base = "/api/actions/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
