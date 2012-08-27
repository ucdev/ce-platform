/*! app/models/person_note 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_note
*/
define("app/models/person_note",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_noteModel = AppModel.extend({
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
