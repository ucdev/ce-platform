/*! app/models/occupation 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Occupation
*/
define("app/models/occupation",["require"],function(require) {
	var AppModel = require("app/model");
	var OccupationModel = AppModel.extend({
		url: function() {
			base = "/api/occupations/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(OccupationModel)
});
