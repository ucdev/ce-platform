/*! app/models/imagetype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Imagetype
*/
define("app/models/Imagetype",function(require,app) {
	app.models.Imagetype = app.Model.extend({
			url: function() {
				base = "/api/imagetypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
