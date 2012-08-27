/*! app/models/person_pref 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_pref
*/
define("app/models/person_pref",["require","app"],function(require,app) {
	var Person_prefModel = app.Model.extend({
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
