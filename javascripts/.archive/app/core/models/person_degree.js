/*! app/models/person_degree 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_degree
*/
define("app/models/Person_degree",function(require,app) {
	app.models.Person_degree = app.Model.extend({
			url: function() {
				base = "/api/person_degrees/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
