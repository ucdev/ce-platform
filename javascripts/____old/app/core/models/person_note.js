/*! app/models/person_note 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_note
*/
define("app/models/Person_note",function(require,app) {
	app.models.Person_note = app.Model.extend({
			url: function() {
				base = "/api/person_notes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
