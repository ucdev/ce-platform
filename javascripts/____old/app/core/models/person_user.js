/*! app/models/person_user 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_user
*/
define("app/models/Person_user",function(require,app) {
	app.models.Person_user = app.Model.extend({
			url: function() {
				base = "/api/person_users/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
