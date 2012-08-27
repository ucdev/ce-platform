/*! app/models/professionarea 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Professionarea
*/
define("app/models/Professionarea",function(require,app) {
	app.models.Professionarea = app.Model.extend({
			url: function() {
				base = "/api/professionareas/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
