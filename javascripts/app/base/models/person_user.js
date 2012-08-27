/*! app/models/person_user 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_user
*/
define("app/models/person_user",["require","app"],function(require,app) {
	var Person_userModel = app.Model.extend({
		url: function() {
			base = "/api/person_users/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_userModel)
});
