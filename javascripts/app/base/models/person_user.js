/*! app/models/person_user 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_user
*/
define("app/models/person_user",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_userModel = AppModel.extend({
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
