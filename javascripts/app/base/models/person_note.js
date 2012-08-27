/*! app/models/person_note 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_note
*/
define("app/models/person_note",["require","app"],function(require,app) {
	var Person_noteModel = app.Model.extend({
		url: function() {
			base = "/api/person_notes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_noteModel)
});
