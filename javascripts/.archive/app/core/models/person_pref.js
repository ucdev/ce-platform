/*! app/models/person_pref 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_pref
*/
define("app/models/Person_pref",function(require,app) {
	app.models.Person_pref = app.Model.extend({
			url: function() {
				base = "/api/person_prefs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
