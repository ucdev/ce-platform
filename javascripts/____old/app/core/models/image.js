/*! app/models/image 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Image
*/
define("app/models/Image",function(require,app) {
	app.models.Image = app.Model.extend({
			url: function() {
				base = "/api/images/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
