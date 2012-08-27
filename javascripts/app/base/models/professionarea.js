/*! app/models/professionarea 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Professionarea
*/
define("app/models/professionarea",["require"],function(require) {
	var AppModel = require("app/model");
	var ProfessionareaModel = AppModel.extend({
		url: function() {
			base = "/api/professionareas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProfessionareaModel)
});
