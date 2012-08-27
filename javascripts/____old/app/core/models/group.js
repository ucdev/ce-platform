/*! app/models/group 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Group
*/
define("app/models/Group",function(require,app) {
	app.models.Group = app.Model.extend({
			url: function() {
				base = "/api/groups/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
