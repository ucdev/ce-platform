/*! app/models/process_person 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Process_person
*/
define("app/models/Process_person",function(require,app) {
	app.models.Process_person = app.Model.extend({
			url: function() {
				base = "/api/process_persons/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
