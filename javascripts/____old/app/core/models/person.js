/*! app/models/person 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person
*/
define("app/models/Person",function(require,app) {
	app.models.Person = app.Model.extend({
			url: function() {
				base = "/api/people/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
