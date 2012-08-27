/*! app/models/processstep 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Processstep
*/
define("app/models/Processstep",function(require,app) {
	app.models.Processstep = app.Model.extend({
			url: function() {
				base = "/api/processsteps/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
