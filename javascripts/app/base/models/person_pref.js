/*! app/models/person_pref 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_pref
*/
define("app/models/person_pref",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_prefModel = AppModel.extend({
		url: function() {
			base = "/api/person_prefs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_prefModel)
});
