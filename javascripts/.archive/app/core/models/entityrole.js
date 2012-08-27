/*! app/models/entityrole 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entityrole
*/
define("app/models/Entityrole",function(require,app) {
	app.models.Entityrole = app.Model.extend({
			url: function() {
				base = "/api/entityroles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
