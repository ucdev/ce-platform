/*! app/models/professionarea 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Professionarea
*/
define("app/models/professionarea",["require","app"],function(require,app) {
	var ProfessionareaModel = app.Model.extend({
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
