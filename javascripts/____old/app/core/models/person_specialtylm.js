/*! app/models/person_specialtylm 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_specialtylm
*/
define("app/models/Person_specialtylm",function(require,app) {
	app.models.Person_specialtylm = app.Model.extend({
			url: function() {
				base = "/api/person_specialtylms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
