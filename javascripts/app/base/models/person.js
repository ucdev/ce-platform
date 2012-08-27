/*! app/models/person 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person
*/
define("app/models/person",["require","app"],function(require,app) {
	var PersonModel = app.Model.extend({
		url: function() {
			base = "/api/people/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PersonModel)
});
