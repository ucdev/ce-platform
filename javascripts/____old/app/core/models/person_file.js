/*! app/models/person_file 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_file
*/
define("app/models/Person_file",function(require,app) {
	app.models.Person_file = app.Model.extend({
			url: function() {
				base = "/api/person_files/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
